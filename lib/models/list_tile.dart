import 'package:debt_payment_tracker_app/constants/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppListTile extends StatelessWidget {
  final String listTitle;
  final String listSubtitle;
  static const Widget listTrailing = Icon(Icons.arrow_forward_ios);
  final Widget listLeading;
  final VoidCallback userTap;

  const AppListTile(
    this.listTitle,
    this.listSubtitle,
    this.listLeading,
    this.userTap, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(3),
        ),
        color: AppColor.primaryDark,
        child: ListTile(
          title: Text(listTitle, style: TextStyle(fontSize: 20)),
          subtitle: Text(listSubtitle),
          trailing: listTrailing,
          leading: listLeading,
          iconColor: AppColor.secondary,
          textColor: Colors.white,
          contentPadding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
            bottom: 10,
          ),
          onTap: userTap,
        ),
      ),
    );
  }
}
