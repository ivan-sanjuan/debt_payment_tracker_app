import 'package:debt_payment_tracker_app/constants/colors.dart';
import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/accounts.dart';
import 'package:debt_payment_tracker_app/models/buttons.dart';
import 'package:debt_payment_tracker_app/screens/add_borrower.dart';
import 'package:flutter/material.dart';

class Ledger {
  BorrowerAccount borrower;
  double? total;
  TransactionType txType;

  Ledger(this.borrower, this.txType);
}

class AppHome extends StatefulWidget {
  final BorrowerAccount? account;

  AppHome({this.account, super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  List<BorrowerAccount> borrowers = [];

  double getTotalBalance() {
    return borrowers.fold(0.0, (sum, borrower) => sum + borrower.getBalance());
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.account?.getBalance() ?? 0.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lending Tracker App',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: [
              const Text(
                'TOTAL LENDED MONEY:',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('${getTotalBalance()}'),
              ElevatedButton(
                onPressed: () async {
                  final newBorrower = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AddBorrower()),
                  );
                  if (newBorrower != null) {
                    setState(() {
                      borrowers.add(newBorrower);
                    });
                  }
                },
                child: const Text("Add Borrower"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
