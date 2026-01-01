import 'package:debt_payment_tracker_app/constants/colors.dart';
import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/borrower_account.dart';
import 'package:debt_payment_tracker_app/models/list_tile.dart';
import 'package:debt_payment_tracker_app/screens/add_borrower.dart';
import 'package:debt_payment_tracker_app/screens/new_transaction.dart';
import 'package:flutter/material.dart';

class AppHome extends StatefulWidget {
  final BorrowerAccount? borrowerAccount;

  const AppHome({this.borrowerAccount, super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  List<BorrowerAccount> borrowers = [];

  double getAllTotal() {
    return borrowers.fold(0, (sum, borrower) => sum + borrower.getBalance());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lending Money Tracker')),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 40, bottom: 30),
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
                  '${getAllTotal()}',
                  style: TextStyle(
                    fontSize: 80,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Expanded(
              child: ListView(
                children: [
                  AppListTile(
                    'Create Borrower Account',
                    'New Borrowers with No Accounts',
                    Icon(Icons.person_add_alt_1_rounded),
                    () async {
                      final newBorrower = await Navigator.of(
                        context,
                      ).push(MaterialPageRoute(builder: (_) => AddBorrower()));
                      if (newBorrower != null) {
                        setState(() {
                          borrowers.add(newBorrower);
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
                          builder: (_) =>
                              NewTransaction(currentBorrowers: borrowers),
                        ),
                      );
                      if (newTransaction != null) {
                        setState(() {
                          borrowers.add(newTransaction);
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
