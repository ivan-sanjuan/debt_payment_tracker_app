import 'package:debt_payment_tracker_app/constants/colors.dart';
import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecentTransactions extends StatefulWidget {
  final Transaction? transaction;

  const RecentTransactions(this.transaction, {super.key});

  @override
  State<RecentTransactions> createState() => _RecentTransactionsState();
}

class _RecentTransactionsState extends State<RecentTransactions> {
  List<Widget> children = [];

  @override
  Widget build(BuildContext context) {
    var name = widget.transaction!.borrowerAccount.name;
    var type = widget.transaction!.txType;
    var amount = widget.transaction!.amount;
    var date = widget.transaction!.txDate;
    var typeIsPayment = type == TransactionType.payLoan;
    final DateFormat formatter = DateFormat('MMM dd');
    final NumberFormat numberFormat = NumberFormat.currency(
      locale: 'en_PH',
      symbol: '₱',
    );

    return Card(
      color: const Color.fromARGB(255, 219, 219, 219),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(5),
      ),
      child: Container(
        padding: EdgeInsets.all(13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: Text(
                formatter.format(date),
                style: TextStyle(
                  color: const Color.fromARGB(255, 58, 58, 58),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              flex: 13,
              child: Text(
                typeIsPayment ? 'Loan Payment' : 'Borrow Money',
                style: TextStyle(
                  color: typeIsPayment ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            Expanded(
              flex: 13,
              child: Text(
                name!,
                style: TextStyle(
                  color: AppColor.primaryDark,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Text(
                '${typeIsPayment ? '-' : ''}${numberFormat.format(amount)}',
                style: TextStyle(
                  color: typeIsPayment ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
