import 'package:debt_payment_tracker_app/models/transaction.dart';

class Borrower {
  final String name;
  final double totalLoan;
  final DateTime acctCreationDate;
  final List<Transaction> transactions = [];

  Borrower(this.name, this.totalLoan, this.acctCreationDate);
}
