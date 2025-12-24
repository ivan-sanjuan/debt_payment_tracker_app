import 'package:debt_payment_tracker_app/models/app_functions.dart';
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
          title: Text(
            'Debt Payment Tracker',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue[800],
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.only(top: 20),
            width: 380,
            child: Column(
              children: [
                Text(
                  'Debt to Collect:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '$debtAmount',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 131, 55),
                  ),
                ),
                AppFunction(onPressed: () {}, label: 'Add NEW Loan'),
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
