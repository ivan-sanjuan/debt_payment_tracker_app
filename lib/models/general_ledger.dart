import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/borrower_account.dart';
import 'package:debt_payment_tracker_app/models/transaction.dart';

class GeneralLedger {
  List<BorrowerAccount> allBorrowers = [];
  List<Transaction> allTransactions = [];

  double getAllTotal() {
    return allTransactions.fold(
      0,
      (sum, transaction) =>
          sum +
          (transaction.txType == TransactionType.payLoan
              ? -transaction.amount
              : transaction.amount),
    );
  }
}
