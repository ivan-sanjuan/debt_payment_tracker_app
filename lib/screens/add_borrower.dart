import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/accounts.dart';
import 'package:debt_payment_tracker_app/models/buttons.dart';
import 'package:debt_payment_tracker_app/models/transaction.dart';
import 'package:debt_payment_tracker_app/screens/app_home.dart';
import 'package:flutter/material.dart';

class AddBorrower extends StatefulWidget {
  const AddBorrower({super.key});

  @override
  State<AddBorrower> createState() => _AddBorrowerState();
}

class _AddBorrowerState extends State<AddBorrower> {
  final TextEditingController userCtrl = TextEditingController();
  final TextEditingController amtCtrl = TextEditingController();

  BorrowerAccount? borrower;
  Ledger? ledger;
  TransactionType? txtype;

  void createBorrowerAcct(String createdUser, double declaredAmt) {
    borrower = BorrowerAccount(createdUser);
    ledger = Ledger(borrower!, TransactionType.addLoan);
    var transaction = Transaction(
      TransactionType.addLoan,
      declaredAmt,
      DateTime.now(),
    );
    borrower!.transactions.add(transaction);
    ledger!.ledgerMap.add({
      'date': DateTime.now(),
      'type': TransactionType.addLoan,
      'borrower': borrower,
      'amount': declaredAmt,
    });
    print("Balance for ${borrower!.name}: ${borrower!.getBalance()}");
    setState(() {});
    Navigator.pop(context, ledger);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Borrower Account')),
      body: Container(
        child: Column(
          children: [
            TextField(controller: userCtrl),
            TextField(controller: amtCtrl),
            FilledButton(
              onPressed: () {
                var createdUser = userCtrl.text;
                var declaredAmt = double.parse(amtCtrl.text);
                createBorrowerAcct(createdUser, declaredAmt);
              },
              child: Text('Click'),
            ),
          ],
        ),
      ),
    );
  }
}
