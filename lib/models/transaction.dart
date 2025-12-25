import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:flutter/foundation.dart';

@immutable
class BorrowerAccounts {
  final DateTime date;
  final String name;
  final double amount;
  final TransactionType transactionType;

  const BorrowerAccounts(
    this.date,
    this.name,
    this.amount,
    this.transactionType,
  );
}
