import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/borrower_account.dart';
import 'package:debt_payment_tracker_app/models/general_ledger.dart';
import 'package:debt_payment_tracker_app/models/transaction.dart';
import 'package:debt_payment_tracker_app/screens/add_borrower.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final GeneralLedger generalLedger;

  const NewTransaction({required this.generalLedger});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  TransactionType? selectedValue;
  var amount = TextEditingController();
  BorrowerAccount? borrowerAccount;

  @override
  Widget build(BuildContext context) {
    List borrowerList = widget.generalLedger.allBorrowers;

    return Scaffold(
      appBar: AppBar(title: Text('New Transaction')),
      body: Container(
        child: (borrowerList.isEmpty)
            ? AlertDialog(
                title: Text('No Borrower Account found'),
                content: Text(
                  'Do you want to be directed to the borrower account creation screen?',
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) =>
                              AddBorrower(generalLedger: widget.generalLedger),
                        ),
                      );
                    },
                    child: Text('Yes'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('No'),
                  ),
                ],
              )
            : Column(
                children: [
                  DropdownMenu(
                    width: double.infinity,
                    hintText: 'Select a Transaction',
                    onSelected: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    dropdownMenuEntries: const [
                      DropdownMenuEntry(
                        value: TransactionType.addLoan,
                        label: 'Add New Loan Entry',
                      ),
                      DropdownMenuEntry(
                        value: TransactionType.payLoan,
                        label: 'Pay an Existing Loan',
                      ),
                    ],
                  ),
                  DropdownMenu(
                    hintText: 'Select an Account',
                    width: double.infinity,
                    onSelected: (valueAcct) {
                      setState(() {
                        borrowerAccount = valueAcct;
                      });
                    },
                    dropdownMenuEntries: (borrowerList.isEmpty)
                        ? [
                            DropdownMenuEntry(
                              value: 'no records',
                              label: 'No Records',
                            ),
                          ]
                        : borrowerList.map((e) {
                            return DropdownMenuEntry(
                              value: e,
                              label: '${e.name}',
                            );
                          }).toList(),
                  ),
                  TextField(controller: amount),
                  ElevatedButton(
                    onPressed: () async {
                      var transaction = await Transaction(
                        selectedValue!,
                        double.parse(amount.text),
                        borrowerAccount!,
                      );
                      borrowerAccount!.transactions.add(transaction);
                      Navigator.pop(context, transaction);
                    },
                    child: Text('Confirm'),
                  ),
                ],
              ),
      ),
    );
  }
}
