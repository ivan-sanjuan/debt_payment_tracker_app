import 'package:flutter/material.dart';
import 'package:debt_payment_tracker_app/screens/app_home.dart';

void main() {
  runApp(
    MaterialApp(home: LendingTrackerApp(), debugShowCheckedModeBanner: false),
  );
}

class LendingTrackerApp extends StatelessWidget {
  const LendingTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppHome();
  }
}
