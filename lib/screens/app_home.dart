import 'package:debt_payment_tracker_app/constants/colors.dart';
import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/buttons.dart';
import 'package:debt_payment_tracker_app/screens/add_record.dart';
import 'package:flutter/material.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  double total = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Text('Lending Tracker', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Text(
                  'TOTAL MONEY LENT:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColor.secondary,
                  ),
                ),
                Text(
                  '$total',
                  style: TextStyle(fontSize: 70, color: AppColor.primary),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton.navigateTo(
                  NewTransaction(),
                  'New Transaction',
                  TransactionType.newTransaction,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
