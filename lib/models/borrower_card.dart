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
    final DateFormat formatter = DateFormat('MMM dd, yyyy');

    return (type == TransactionType.payLoan
        ? Card(
            color: const Color.fromARGB(255, 219, 219, 219),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      formatter.format(date),
                      style: TextStyle(
                        color: const Color.fromARGB(255, 58, 58, 58),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Loan Payment',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  Expanded(
                    child: Text(
                      name!,
                      style: TextStyle(
                        color: AppColor.primaryDark,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    child: Text(
                      '-$amount',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Card(
            color: const Color.fromARGB(255, 219, 219, 219),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      formatter.format(date),
                      style: TextStyle(
                        color: const Color.fromARGB(255, 58, 58, 58),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Borrow Money',
                      style: TextStyle(
                        color: Colors.red[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  Expanded(
                    child: Text(
                      name!,
                      style: TextStyle(
                        color: AppColor.primaryDark,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    child: Text(
                      '$amount',
                      style: TextStyle(
                        color: Colors.red[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
  }
}
