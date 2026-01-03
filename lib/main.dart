import 'package:debt_payment_tracker_app/constants/colors.dart';
import 'package:debt_payment_tracker_app/models/borrower_account.dart';
import 'package:debt_payment_tracker_app/models/general_ledger.dart';
import 'package:debt_payment_tracker_app/screens/app_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: LendingTrackerApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColor.primary,
        brightness: Brightness.light,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColor.primaryDark),
            foregroundColor: WidgetStateProperty.all(Colors.white),
            textStyle: WidgetStateProperty.all(TextStyle()),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColor.primaryDark,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
    ),
  );
}

class LendingTrackerApp extends StatelessWidget {
  final GeneralLedger ledger = GeneralLedger();
  LendingTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppHome(generalLedger: ledger);
  }
}
