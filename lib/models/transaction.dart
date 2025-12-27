import 'package:debt_payment_tracker_app/constants/transaction_type.dart';

class Transaction {
  TransactionType transactionType;
  double amount;
  DateTime txdate;

  Transaction(this.transactionType, this.amount, this.txdate);
}
