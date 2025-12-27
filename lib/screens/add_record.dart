import 'package:debt_payment_tracker_app/constants/colors.dart';
import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/accounts.dart';
import 'package:debt_payment_tracker_app/models/buttons.dart';
import 'package:debt_payment_tracker_app/models/transaction.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({super.key});

  @override
  State<NewTransaction> createState() => _AddRecordState();
}

class _AddRecordState extends State<NewTransaction> {
  TextEditingController amtCtrl = TextEditingController();
  late Borrower borrowerAcct;

  @override
  void initState() {
    super.initState();
    borrowerAcct = Borrower('Lando', 0.0, DateTime.now());
  }

  void addTransaction() {
    double amount = double.tryParse(amtCtrl.text) ?? 00;
    Transaction record = Transaction(
      TransactionType.newTransaction,
      DateTime.now(),
      amount,
    );
    borrowerAcct.transactions.map((x) => x.toJson()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Transaction', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColor.primary,
      ),
      body: Container(
        child: Column(
          children: [
            TextField(controller: amtCtrl, keyboardType: TextInputType.number),
            AppButton.invoke(addTransaction, 'Confirm'),
          ],
        ),
      ),
    );
  }
}
