import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/borrower_account.dart';
import 'package:debt_payment_tracker_app/models/borrower_card.dart';
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
    var borrowerAccount = BorrowerAccount(nameCtrl.text);
    var transaction = Transaction(
      TransactionType.addLoan,
      double.parse(amtCtrl.text),
      borrowerAccount,
    );
    borrowerAccount.transactions.add(transaction);
    widget.generalLedger.allTransactions.add(transaction);
    widget.generalLedger.allBorrowers.add(borrowerAccount);
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
