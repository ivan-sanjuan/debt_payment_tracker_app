import 'package:debt_payment_tracker_app/constants/colors.dart';
import 'package:debt_payment_tracker_app/models/accounts.dart';
import 'package:debt_payment_tracker_app/models/buttons.dart';
import 'package:debt_payment_tracker_app/screens/add_borrower.dart';
import 'package:flutter/material.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  var amount = TextEditingController();
  var total = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Text(
          'Lending Tracker App',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
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
                '$total',
                style: TextStyle(fontSize: 70, color: AppColor.primary),
              ),
              AppButton.navigate('Record NEW Transaction', AddBorrower()),
              AppButton.navigate('Add Borrower Account', AddBorrower()),
            ],
          ),
        ),
      ),
    );
  }
}
