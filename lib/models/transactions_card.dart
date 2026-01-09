import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/borrower_account.dart';
import 'package:debt_payment_tracker_app/models/transaction.dart';
import 'package:flutter/material.dart';

class AppTxCard extends StatelessWidget {
  final Transaction? transaction;

  const AppTxCard({required this.transaction, super.key});

  @override
  Widget build(BuildContext context) {
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
              flex: 5,
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
                  Text('${transaction!.txDate}'),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: (transaction!.txType == TransactionType.payLoan
                    ? Text(
                        '-₱${transaction!.amount}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightGreen,
                        ),
                      )
                    : Text(
                        '₱${transaction!.amount}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
