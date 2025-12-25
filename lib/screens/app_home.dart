import 'package:debt_payment_tracker_app/constants/colors.dart';
import 'package:debt_payment_tracker_app/models/app_functions.dart';
import 'package:debt_payment_tracker_app/models/navigator_class.dart';
import 'package:debt_payment_tracker_app/screens/second_screen.dart';
import 'package:flutter/material.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  double debtAmount = 9000.00;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primary,
          title: Text(
            'Debt Payment Tracker',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.only(top: 30),
            width: 350,
            child: Column(
              children: [
                Text(
                  'DEBT TO COLLECT:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primary,
                  ),
                ),
                Text(
                  '$debtAmount',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppColor.secondaryDark,
                  ),
                ),
                AppFunction(
                  onPressed: () {
                    NavClass(AddLoan()).navPush(context);
                  },
                  label: 'Add NEW Loan',
                ),
                AppFunction(onPressed: () {}, label: 'Remove Loan'),
                AppFunction(onPressed: () {}, label: 'View Ledger'),
                AppFunction(onPressed: () {}, label: 'Exit'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
