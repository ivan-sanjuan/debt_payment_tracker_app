import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function? onPressed;
  final Widget? navigateTo;
  final String label;
  final TransactionType? transactionType;

  const AppButton.invoke(this.onPressed, this.label, [this.transactionType])
    : navigateTo = null;
  const AppButton.navigateTo(
    this.navigateTo,
    this.label, [
    this.transactionType,
  ]) : onPressed = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      width: double.infinity,
      height: 80,
      child: ElevatedButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          } else if (navigateTo != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => navigateTo!),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(label, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
