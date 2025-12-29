import 'package:debt_payment_tracker_app/models/transaction.dart';
import 'package:debt_payment_tracker_app/constants/transaction_type.dart';

class BorrowerAccount {
  String? name;
  List<Transaction> transactions = [];

  BorrowerAccount([this.name]);

  double createTransaction(Transaction transaction) {
    transactions.add(transaction);
    return getBalance();
  }

  double getBalance() {
    return transactions.fold(
      0,
      (sum, n) =>
          sum +
          (n.transactionType == TransactionType.payLoan ? -n.amount : n.amount),
    );
  }
}
