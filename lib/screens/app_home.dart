import 'dart:math';

import 'package:debt_payment_tracker_app/constants/colors.dart';
import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/borrower_account.dart';
import 'package:debt_payment_tracker_app/models/card_recent_transactions.dart';
import 'package:debt_payment_tracker_app/models/general_ledger.dart';
import 'package:debt_payment_tracker_app/models/list_tile.dart';
import 'package:debt_payment_tracker_app/models/transaction.dart';
import 'package:debt_payment_tracker_app/screens/add_borrower.dart';
import 'package:debt_payment_tracker_app/screens/new_transaction.dart';
import 'package:debt_payment_tracker_app/screens/view_transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppHome extends StatefulWidget {
  final GeneralLedger generalLedger;
  const AppHome({required this.generalLedger, super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  final phCurrency = NumberFormat.currency(locale: 'en_PH', symbol: '₱');
  @override
  Widget build(BuildContext context) {
    final allBorrowers = widget.generalLedger.allBorrowers;
    final allTransactions = widget.generalLedger.allTransactions;
    return Scaffold(
      appBar: AppBar(title: Text('Money Lending Tracker')),
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
                  phCurrency.format(widget.generalLedger.getAllTotal()),
                  style: TextStyle(
                    fontSize: 60,
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
                      setState(() {});
                    }
                  },
                ),
                AppListTile(
                  'New Transaction',
                  'Pay or Add existing loans',
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
                      setState(() {});
                    }
                  },
                ),
                AppListTile(
                  'View Borrower Transactions',
                  'View all transactions of a borrower',
                  Icon(Icons.list),
                  () async {
                    final newBorrower = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ViewTransactions(
                          generalLedger: widget.generalLedger,
                        ),
                      ),
                    );
                    if (newBorrower != null) {
                      setState(() {});
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
                      SingleChildScrollView(
                        child: Column(
                          children: (allTransactions.isNotEmpty == true
                              ? allTransactions
                                    .sublist(max(0, allTransactions.length - 5))
                                    .reversed
                                    .map((e) {
                                      return RecentTransactions(e);
                                    })
                                    .toList()
                              : [
                                  Center(
                                    child: Text('No Transactions Recorded.'),
                                  ),
                                ]),
                        ),
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
