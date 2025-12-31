import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/borrower_account.dart';

class Transaction {
  final DateTime txDate = DateTime.now();
  final TransactionType txType;
  final double amount;
  final BorrowerAccount borrowerAccount;

  Transaction(this.txType, this.amount, this.borrowerAccount);
}
