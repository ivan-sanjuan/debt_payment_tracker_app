import 'package:flutter/material.dart';

class NavClass {
  final Widget page;

  NavClass(this.page);

  void navPush(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
