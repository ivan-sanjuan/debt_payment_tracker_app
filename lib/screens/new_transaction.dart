import 'package:debt_payment_tracker_app/constants/colors.dart';
import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/borrower_account.dart';
import 'package:debt_payment_tracker_app/models/general_ledger.dart';
import 'package:debt_payment_tracker_app/models/transaction.dart';
import 'package:debt_payment_tracker_app/screens/add_borrower.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  double runValue = 0;
  NumberFormat numberFormat = NumberFormat.currency(
    locale: 'en_PH',
    symbol: '₱',
  );

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
                              numberFormat.format(
                                (borrowerAccount!
                                    .getBorrowerBalance()
                                    .toStringAsFixed(2)),
                              ),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 80,
                                color: AppColor.secondary,
                              ),
                            ),

                            Text(
                              'Balance after Transaction:',
                              style: TextStyle(
                                color: AppColor.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              numberFormat.format(runValue.toStringAsFixed(2)),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 80,
                                color: (selectedValue == TransactionType.payLoan
                                    ? AppColor.secondary
                                    : Colors.red),
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
                          runValue = borrowerAccount!.getBorrowerBalance();
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
                          amount.clear();
                          runValue = borrowerAccount!.getBorrowerBalance();
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
                      maxLines: 1,
                      decoration: InputDecoration(
                        hint: Text(
                          'Enter Amount',
                          style: TextStyle(color: Colors.grey),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (onChangedValue) {
                        setState(() {
                          final parse = (double.tryParse(onChangedValue) ?? 0);
                          if (selectedValue == TransactionType.payLoan &&
                              double.parse(onChangedValue) >
                                  borrowerAccount!.getBorrowerBalance()) {
                            amount.text =
                                '${borrowerAccount!.getBorrowerBalance()}';
                            runValue = 0;
                          }
                          runValue = selectedValue == TransactionType.payLoan
                              ? borrowerAccount!.getBorrowerBalance() - parse
                              : borrowerAccount!.getBorrowerBalance() + parse;
                        });
                      },
                    ),
                    Container(
                      width: double.infinity,
                      height: 65,
                      child: ElevatedButton(
                        onPressed: () {
                          var transaction = Transaction(
                            selectedValue!,
                            double.parse(amount.text),
                            borrowerAccount!,
                          );
                          borrowerAccount!.createTransaction(transaction);
                          Navigator.pop(context, transaction);
                        },
                        child: Text('Confirm', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
