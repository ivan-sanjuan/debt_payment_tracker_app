class NewTransaction {
  final String name;
  List<Transaction> transactions = [];

  NewTransaction(this.name, this.transactions);
}

class Transaction {
  final double amount;
  final DateTime date;

  Transaction(this.amount, this.date);
}
