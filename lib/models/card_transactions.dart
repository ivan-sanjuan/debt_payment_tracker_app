import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/borrower_account.dart';
import 'package:debt_payment_tracker_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppTxCard extends StatelessWidget {
  final Transaction? transaction;

  const AppTxCard({required this.transaction, super.key});

  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('MMM d, yyyy hh:mm a');
    NumberFormat numberFormat = NumberFormat.currency(
      locale: 'en_PH',
      symbol: '₱',
    );
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(5),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (transaction!.txType == TransactionType.payLoan
                      ? Text(
                          'Payment',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.lightGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          'Borrow Money',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  Text(formatter.format(transaction!.txDate)),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Text(
                  '${transaction!.txType == TransactionType.payLoan ? '-' : ''}${numberFormat.format(transaction!.amount)}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: (transaction!.txType == TransactionType.payLoan
                        ? Colors.lightGreen
                        : Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
