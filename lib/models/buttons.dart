import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Widget? screen;
  final String label;
  final TransactionType transactionType;

  const AppButton(this.screen, this.label, this.transactionType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      width: double.infinity,
      height: 80,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => screen!));
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
