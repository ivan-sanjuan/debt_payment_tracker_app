import 'package:debt_payment_tracker_app/constants/colors.dart';
import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/borrower_account.dart';
import 'package:debt_payment_tracker_app/models/card_recent_transactions.dart';
import 'package:debt_payment_tracker_app/models/general_ledger.dart';
import 'package:debt_payment_tracker_app/models/transaction.dart';
import 'package:flutter/material.dart';

class AddBorrower extends StatefulWidget {
  final GeneralLedger generalLedger;
  const AddBorrower({required this.generalLedger, super.key});

  @override
  State<AddBorrower> createState() => _AddBorrowerState();
}

class _AddBorrowerState extends State<AddBorrower> {
  var nameCtrl = TextEditingController();
  var amtCtrl = TextEditingController();

  void createBorrowerAccount() {
    var createdBorrower = BorrowerAccount(
      ledger: widget.generalLedger,
      name: nameCtrl.text,
    );
    var transaction = Transaction(
      TransactionType.addLoan,
      double.parse(amtCtrl.text),
      createdBorrower,
    );
    createdBorrower.createTransaction(transaction);
    createdBorrower.addBorrowerToGeneralLedger(createdBorrower);
    Navigator.pop(context, createdBorrower);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Borrower')),
      body: Expanded(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            spacing: 10,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: InputDecoration(
                  hint: Text(
                    'Enter Full Name',
                    style: TextStyle(color: Colors.grey),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: amtCtrl,
                decoration: InputDecoration(
                  hint: Text(
                    'Amount Borrowed',
                    style: TextStyle(color: Colors.grey),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: createBorrowerAccount,
                child: Text('Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
