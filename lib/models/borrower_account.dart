import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/transaction.dart';

class BorrowerAccount {
  final String name;
  List<Transaction> transactions = [];

  BorrowerAccount(this.name);

  double createTransaction(Transaction transaction) {
    transactions.add(transaction);
    return getBalance();
  }

  double getBalance() {
    return transactions.fold(
      0,
      (total, x) =>
          total + (x.txType == TransactionType.payLoan ? -x.amount : x.amount),
    );
  }
}
