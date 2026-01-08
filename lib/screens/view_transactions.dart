import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/borrower_account.dart';
import 'package:debt_payment_tracker_app/models/general_ledger.dart';
import 'package:debt_payment_tracker_app/screens/add_borrower.dart';
import 'package:flutter/material.dart';

class ViewTransactions extends StatefulWidget {
  final GeneralLedger generalLedger;

  const ViewTransactions({required this.generalLedger, super.key});

  @override
  State<ViewTransactions> createState() => _ViewTransactionsState();
}

class _ViewTransactionsState extends State<ViewTransactions> {
  BorrowerAccount? selectedAccount;
  @override
  Widget build(BuildContext context) {
    var borrowerAccounts = widget.generalLedger.allBorrowers;
    return Scaffold(
      appBar: AppBar(title: Text('View Transactions')),
      body: (borrowerAccounts.isEmpty == true
          ? AlertDialog(
              title: Text('No Borrower Account Found.'),
              content: Text(
                'Do you want to be directed to the borrower account creation screen?',
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    Navigator.of(context)
                        .push(
                          MaterialPageRoute(
                            builder: (_) => AddBorrower(
                              generalLedger: widget.generalLedger,
                            ),
                          ),
                        )
                        .then((newBorrower) {
                          if (newBorrower != null) {}
                          setState(() {
                            Navigator.pop(context, newBorrower);
                          });
                        });
                  },
                  child: Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('No'),
                ),
              ],
            )
          : Column(
              children: [
                DropdownMenu(
                  dropdownMenuEntries: borrowerAccounts.map((e) {
                    return DropdownMenuEntry(value: e, label: '${e.name}');
                  }).toList(),
                  onSelected: (BorrowerAccount? value) {
                    setState(() {
                      selectedAccount = value;
                    });
                  },
                ),
              ],
            )),
    );
  }
}
