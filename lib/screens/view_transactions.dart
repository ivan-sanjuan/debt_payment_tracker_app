import 'package:debt_payment_tracker_app/models/borrower_account.dart';
import 'package:debt_payment_tracker_app/models/general_ledger.dart';
import 'package:flutter/material.dart';

class ViewTransactions extends StatefulWidget {
  final GeneralLedger generalLedger;

  const ViewTransactions({required this.generalLedger, super.key});

  @override
  State<ViewTransactions> createState() => _ViewTransactionsState();
}

class _ViewTransactionsState extends State<ViewTransactions> {
  @override
  Widget build(BuildContext context) {
    var borrowerAccounts = widget.generalLedger.allBorrowers;
    return Scaffold(
      appBar: AppBar(title: Text('View Transactions')),
      body: Column(
        children: [
          DropdownMenu(
            dropdownMenuEntries: borrowerAccounts.map((e) {
              return DropdownMenuEntry(value: e, label: '${e.name}');
            }).toList(),
          ),
        ],
      ),
    );
  }
}
