import 'package:debt_payment_tracker_app/constants/colors.dart';
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
                title: Text('No Borrower Account Found'),
                content: Text(
                  'Do you want to be directed to the borrower account creation screen?',
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(
                            MaterialPageRoute(
                              builder: (_) => AddBorrower(
                                generalLedger: widget.generalLedger,
                              ),
                            ),
                          )
                          .then((newBorrower) {
                            if (newBorrower != null) {
                              setState(() {
                                borrowerAccount = newBorrower;
                                Navigator.pop(context, newBorrower);
                              });
                            }
                          });
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
            : Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  spacing: 10,
                  children: [
                    ...(borrowerAccount != null
                        ? [
                            Text(
                              'Current Balance:',
                              style: TextStyle(
                                color: AppColor.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              '${borrowerAccount!.getBorrowerBalance()}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 80,
                                color: AppColor.secondary,
                              ),
                            ),
                          ]
                        : [
                            Text(
                              'No Account Selected',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primary,
                              ),
                            ),
                            Text(
                              '0.0',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 80,
                                color: AppColor.secondary,
                              ),
                            ),
                          ]),
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

                    TextField(
                      controller: amount,
                      decoration: InputDecoration(
                        hint: Text(
                          'Enter Amount',
                          style: TextStyle(color: Colors.grey),
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        var transaction = Transaction(
                          selectedValue!,
                          double.parse(amount.text),
                          borrowerAccount!,
                        );
                        borrowerAccount!.createTransaction(transaction);
                        Navigator.pop(context, transaction);
                      },
                      child: Text('Confirm'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
