import 'package:debt_payment_tracker_app/constants/colors.dart';
import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/borrower_account.dart';
import 'package:debt_payment_tracker_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BorrowerCard extends StatefulWidget {
  final Transaction? transaction;

  const BorrowerCard(this.transaction, {super.key});

  @override
  State<BorrowerCard> createState() => _BorrowerCardState();
}

class _BorrowerCardState extends State<BorrowerCard> {
  List<Widget> children = [];

  @override
  Widget build(BuildContext context) {
    var name = widget.transaction!.borrowerAccount.name;
    var type = widget.transaction!.txType;
    var amount = widget.transaction!.amount;
    var date = widget.transaction!.txDate;
    final DateFormat formatter = DateFormat('MMM d, yyyy');

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(5),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(DateFormat('MMM d, yyyy').format(date)),
            Text(
              (type == TransactionType.addLoan
                  ? 'Additional Loan'
                  : 'Loan Payment'),
            ),
            Text(name),
            Text('$amount'),
          ],
        ),
      ),
    );
  }
}
