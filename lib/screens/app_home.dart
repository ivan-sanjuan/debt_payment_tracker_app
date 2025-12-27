import 'package:debt_payment_tracker_app/constants/colors.dart';
import 'package:flutter/material.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  var amount = 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Text(
          'Lending Tracker App',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Text('TOTAL LENDED MONEY:'),
          Text(total)
        ],
      ),
    );
  }
}
