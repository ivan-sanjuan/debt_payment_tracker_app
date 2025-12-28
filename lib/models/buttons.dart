import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  final Widget? screen;

  const AppButton.invoke(this.text, this.onPressed, {super.key})
    : screen = null;
  const AppButton.navigate(this.text, this.screen, {super.key})
    : onPressed = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 100,
      child: ElevatedButton(
        onPressed: () => {
          if (onPressed != null)
            {onPressed!()}
          else if (screen != null)
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => screen!),
              ),
            },
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          elevation: 1,
        ),
        child: Text(text, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
