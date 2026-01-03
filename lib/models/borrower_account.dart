import 'package:debt_payment_tracker_app/constants/transaction_type.dart';
import 'package:debt_payment_tracker_app/models/general_ledger.dart';
import 'package:debt_payment_tracker_app/models/transaction.dart';

class BorrowerAccount {
  final String? name;
  GeneralLedger? ledger;
  List<Transaction> borrowerTransactionsList = [];

  BorrowerAccount({required this.ledger, required this.name});

  void createTransaction(Transaction transaction) {
    borrowerTransactionsList.add(transaction);
    ledger!.allTransactions.add(transaction);
  }

  void addBorrowerToGeneralLedger(BorrowerAccount account) {
    ledger!.allBorrowers.add(account);
  }

  double getBorrowerBalance() {
    return borrowerTransactionsList.fold(
      0,
      (total, x) =>
          total + (x.txType == TransactionType.payLoan ? -x.amount : x.amount),
    );
  }
}
