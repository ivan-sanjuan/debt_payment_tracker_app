import 'package:flutter/material.dart';

class NavClass {
  Widget nav;

  NavClass(this.nav);

  void navPush(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => nav));
  }
}
