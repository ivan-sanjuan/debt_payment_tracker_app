import 'package:flutter/material.dart';

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
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 4, 83, 148),
            minimumSize: Size(double.infinity, 75),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
