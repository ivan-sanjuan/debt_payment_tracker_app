import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/borrower_account.dart';
import 'package:debt_payment_tracker_app/models/transaction.dart';
import 'package:flutter/material.dart';

class AddBorrower extends StatefulWidget {
  const AddBorrower({super.key});

  @override
  State<AddBorrower> createState() => _AddBorrowerState();
}

class _AddBorrowerState extends State<AddBorrower> {
  var nameCtrl = TextEditingController();
  var amtCtrl = TextEditingController();

  void createBorrowerAccount() {
    var borrowerAccount = BorrowerAccount(nameCtrl.text);
    var transaction = Transaction(
      TransactionType.addLoan,
      double.parse(amtCtrl.text),
      borrowerAccount,
    );
    borrowerAccount.transactions.add(transaction);
    Navigator.pop(context, borrowerAccount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Borrower')),
      body: Column(
        children: [
          TextField(controller: nameCtrl),
          TextField(controller: amtCtrl),
          ElevatedButton(
            onPressed: createBorrowerAccount,
            child: Text('Create Account'),
          ),
        ],
      ),
    );
  }
}
