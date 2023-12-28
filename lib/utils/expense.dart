class Expense {
  final int? id;
  final String time;
  final String category;
  final String description;
  final String account;
  final double amount;

  const Expense({
    this.id,
    required this.time,
    required this.category,
    required this.description,
    required this.account,
    required this.amount,
  });

  factory Expense.fromJson(Map<String, dynamic> json) => Expense(
        time: json['time'],
        category: json['category'],
        description: json['description'],
        account: json['account'],
        amount: double.parse(json['amount'].toString()),
      );

  Map<String, dynamic> toJson() {
    var map = {
      'id': id,
      'time': time,
      'category': category,
      'description': description,
      'account': account,
      'amount': amount,
    };
    map.removeWhere((key, value) => value == null);

    return map;
  }

  @override
  String toString() {
    return 'id: $id, time: $time, category: $category, description: $description, account: $account, amount: $amount';
  }
}
