import 'package:flutter/material.dart';
import 'package:debt_payment_tracker_app/screens/app_home.dart';

void main() {
  runApp(
    MaterialApp(home: DebtPaymentApp(), debugShowCheckedModeBanner: false),
  );
}

class DebtPaymentApp extends StatelessWidget {
  const DebtPaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppHome();
  }
}
