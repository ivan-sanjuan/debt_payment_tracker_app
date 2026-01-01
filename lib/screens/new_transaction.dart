import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/borrower_account.dart';
import 'package:debt_payment_tracker_app/models/transaction.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final List currentBorrowers;

  const NewTransaction({required this.currentBorrowers});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  static const String defaultValue = 'default';

  @override
  Widget build(BuildContext context) {
    List borrowerNames = widget.currentBorrowers
        .map((e) => e.name)
        .toSet()
        .toList();
    return Scaffold(
      appBar: AppBar(title: Text('New Transaction')),
      body: Container(
        child: Column(
          children: [
            DropdownMenu(
              width: double.infinity,
              initialSelection: defaultValue,
              onSelected: (value) {
                setState(() {
                  var selectedValue = value;
                });
              },
              dropdownMenuEntries: const [
                DropdownMenuEntry(
                  value: TransactionType.addLoan,
                  label: 'Add New Loan Entry',
                ),
                DropdownMenuEntry(
                  value: TransactionType.payLoan,
                  label: 'Pay an Existing Loan',
                ),
              ],
            ),
            Text('$borrowerNames'),
          ],
        ),
      ),
    );
  }
}
