import 'package:debt_payment_tracker_app/constants/colors.dart';
import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/borrower_account.dart';
import 'package:debt_payment_tracker_app/models/borrower_card.dart';
import 'package:debt_payment_tracker_app/models/general_ledger.dart';
import 'package:debt_payment_tracker_app/models/list_tile.dart';
import 'package:debt_payment_tracker_app/models/transaction.dart';
import 'package:debt_payment_tracker_app/screens/add_borrower.dart';
import 'package:debt_payment_tracker_app/screens/new_transaction.dart';
import 'package:flutter/material.dart';

class AppHome extends StatefulWidget {
  final GeneralLedger generalLedger;
  const AppHome({required this.generalLedger, super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    final allBorrowers = widget.generalLedger.allBorrowers;
    final allTransactions = widget.generalLedger.allTransactions;
    return Scaffold(
      appBar: AppBar(title: Text('Lending Money Tracker')),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.primaryDark,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'TOTAL LENDED MONEY:',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${widget.generalLedger.getAllTotal()}',
                  style: TextStyle(
                    fontSize: 80,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                AppListTile(
                  'Create Borrower Account',
                  'New Borrowers with No Accounts',
                  Icon(Icons.person_add_alt_1_rounded),
                  () async {
                    final newBorrower = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) =>
                            AddBorrower(generalLedger: widget.generalLedger),
                      ),
                    );
                    if (newBorrower != null) {
                      setState(() {
                        allBorrowers.add(newBorrower);
                      });
                    }
                  },
                ),
                AppListTile(
                  'New Transaction',
                  'Pay or Add on Existing Accounts',
                  Icon(Icons.payments_rounded),
                  () async {
                    final newTransaction = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => NewTransaction(
                          generalLedger: widget.generalLedger,
                          // currentBorrowers: allBorrowers,
                        ),
                      ),
                    );
                    if (newTransaction != null) {
                      setState(() {
                        allTransactions.add(newTransaction);
                      });
                    }
                  },
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' Recent Transactions',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primary,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Column(
                        children: (allTransactions.isNotEmpty == true
                            ? allTransactions.map((e) {
                                return BorrowerCard(e);
                              }).toList()
                            : [
                                Center(
                                  child: Text('No Transactions Recorded.'),
                                ),
                              ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
