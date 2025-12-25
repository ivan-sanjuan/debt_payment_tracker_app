import 'package:debt_payment_tracker_app/models/textfield_class.dart';
import 'package:flutter/material.dart';

class AddLoan extends StatefulWidget {
  const AddLoan({super.key});

  @override
  State<AddLoan> createState() => _AddLoanState();
}

class _AddLoanState extends State<AddLoan> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController amtCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Second Screen'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextfieldClass(nameCtrl, Text('Name'), focus: true),
            TextfieldClass(amtCtrl, Text('Amount')),
            TextfieldClass(nameCtrl, Text('Date')),
            TextfieldClass(nameCtrl, Text('Remarks')),
          ],
        ),
      ),
    );
  }
}
