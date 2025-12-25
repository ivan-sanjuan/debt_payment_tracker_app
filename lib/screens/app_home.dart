import 'package:debt_payment_tracker_app/constants/colors.dart';
import 'package:debt_payment_tracker_app/models/buttons.dart';
import 'package:debt_payment_tracker_app/screens/add_record.dart';
import 'package:flutter/material.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  double total = 10000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Text(
          'Lending Payment Tracker',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'TOTAL MONEY LENT:',
              style: TextStyle(
                color: AppColor.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              '₱ $total',
              style: TextStyle(fontSize: 50, color: AppColor.primary),
            ),
            AppButtons(screen: AddRecord(), label: 'Add NEW Borrower'),
            AppButtons(screen: AddRecord(), label: 'Borrower Accounts'),
            AppButtons(screen: AddRecord(), label: 'Recent Transactions'),
            AppButtons(screen: AddRecord(), label: 'Exit'),
          ],
        ),
      ),
    );
  }
}
