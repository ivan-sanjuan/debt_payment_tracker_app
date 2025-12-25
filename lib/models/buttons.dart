import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {
  final Widget? screen;
  final String label;

  const AppButtons({this.screen, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      height: 100,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => screen!)),
        child: Text(label, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
