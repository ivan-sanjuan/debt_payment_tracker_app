import 'package:flutter/material.dart';

class TextfieldClass extends StatelessWidget {
  final String fieldName;
  final TextEditingController ctrl;
  final IconData? iconfield;

  const TextfieldClass(this.fieldName, this.ctrl, {this.iconfield, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: TextField(
        controller: ctrl,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text(fieldName),
          suffixIcon: Icon(iconfield),
        ),
      ),
    );
  }
}
