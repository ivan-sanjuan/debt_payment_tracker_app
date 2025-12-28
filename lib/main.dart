import 'package:debt_payment_tracker_app/constants/colors.dart';
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
      ),
    ),
  );
}

class LendingTrackerApp extends StatelessWidget {
  const LendingTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppHome();
  }
}
