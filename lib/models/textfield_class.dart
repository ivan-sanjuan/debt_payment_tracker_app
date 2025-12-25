import 'package:flutter/material.dart';

class TextfieldClass extends StatelessWidget {
  final TextEditingController ctrl;
  final Widget labelText;
  final bool focus;

  const TextfieldClass(
    this.ctrl,
    this.labelText, {
    this.focus = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: ctrl,
        autofocus: focus,
        decoration: InputDecoration(
          label: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
