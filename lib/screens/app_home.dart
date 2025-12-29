import 'package:debt_payment_tracker_app/constants/colors.dart';
import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/accounts.dart';
import 'package:debt_payment_tracker_app/models/buttons.dart';
import 'package:debt_payment_tracker_app/screens/add_borrower.dart';
import 'package:flutter/material.dart';

class Ledger {
  BorrowerAccount borrower;
  List<Map<String, dynamic>> ledgerMap = [];
  TransactionType txType;

  Ledger(this.borrower, this.txType);

  void addEntry(TransactionType type, double amount) {
    ledgerMap.add({
      'date': DateTime.now(),
      'type': type,
      'borrower': borrower,
      'amount': amount,
    });
  }

  double getAllTotal() {
    return ledgerMap.fold(0.0, (total, x) {
      final amt = x['amount'] as double;
      return total + ((x['type'] == TransactionType.payLoan) ? -amt : amt);
    });
  }
}

class AppHome extends StatefulWidget {
  final BorrowerAccount? account;

  AppHome({this.account, super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  BorrowerAccount? user = BorrowerAccount();
  Ledger? ledger;

  @override
  void initState() {
    super.initState();
    user = widget.account;
    if (user != null) {
      ledger = Ledger(user!, TransactionType.addLoan);
    }
  }

  @override
  Widget build(BuildContext context) {
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
              Text('${ledger?.getAllTotal() ?? 0}'),
              ElevatedButton(
                onPressed: () async {
                  final newLedger = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AddBorrower()),
                  );
                  if (newLedger != null && newLedger is Ledger) {
                    setState(() {
                      ledger = newLedger;
                    });
                  }
                },
                child: Text('Add Borrower'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
