class NewTransaction {
  final String name;
  List<Transaction> transaction = [];

  NewTransaction(this.name, this.transaction);
}

class Transaction {
  final double amount;
  final DateTime date;

  Transaction(this.amount, this.date);
}
