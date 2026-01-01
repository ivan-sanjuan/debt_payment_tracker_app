import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/transaction.dart';

class BorrowerAccount {
  final String name;
  List<Transaction> transactions = [];

  BorrowerAccount(this.name);

  void createTransaction(Transaction transaction) {
    transactions.add(transaction);
  }

  double getBalance() {
    return transactions.fold(
      0,
      (total, x) =>
          total + (x.txType == TransactionType.payLoan ? -x.amount : x.amount),
    );
  }
}
