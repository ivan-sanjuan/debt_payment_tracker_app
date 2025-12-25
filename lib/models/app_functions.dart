import 'package:flutter/material.dart';
import 'package:debt_payment_tracker_app/constants/colors.dart';

@immutable
class AppFunction extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const AppFunction({required this.onPressed, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          label: Text(
            label,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryDark,
            minimumSize: Size(double.infinity, 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
