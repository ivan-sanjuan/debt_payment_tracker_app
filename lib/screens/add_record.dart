import 'package:debt_payment_tracker_app/constants/colors.dart';
import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/buttons.dart';
import 'package:debt_payment_tracker_app/models/date_picker.dart';
import 'package:debt_payment_tracker_app/models/textfield_class.dart';
import 'package:debt_payment_tracker_app/models/transaction.dart';
import 'package:flutter/material.dart';

class AddRecord extends StatefulWidget {
  const AddRecord({super.key});

  @override
  State<AddRecord> createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController amtCtrl = TextEditingController();
  final DatePicker datePicker = DatePicker();
  List<BorrowerAccounts> borrowerAccount = [];

  addRecord() {
    final borrower = BorrowerAccounts(
      datePicker.selectedDate,
      nameCtrl.text,
      double.tryParse(amtCtrl.text) ?? 0.0,
      TransactionType.addBorrower,
    );
    setState(() {
      borrowerAccount.add(borrower);
    });
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Text('Add New Record', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            datePicker,
            TextfieldClass(
              'Borrower Name',
              nameCtrl,
              iconfield: Icons.person_3_outlined,
            ),
            TextfieldClass('Amount', amtCtrl),
            ElevatedButton(onPressed: addRecord(), child: child),
          ],
        ),
      ),
    );
  }
}
