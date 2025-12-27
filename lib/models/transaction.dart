import 'package:debt_payment_tracker_app/constants/transaction_type.dart';

class Transaction {
  final TransactionType transactionType;
  final DateTime transactionDate;
  final double amount;

  Transaction(this.transactionType, this.transactionDate, this.amount);

  Map<String, dynamic> toJson() {
    return {
      'transactionType': transactionType,
      'transactionDate': transactionDate,
      'amount': amount,
    };
  }
}
