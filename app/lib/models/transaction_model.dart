class TransactionModel {
  final String id;
  final double amount;
  final String type; // 'recharge' or 'withdraw'
  final DateTime date;

  TransactionModel({
    required this.id,
    required this.amount,
    required this.type,
    required this.date,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['_id'],
      amount: (json['amount'] ?? 0).toDouble(),
      type: json['type'] ?? '',
      date: DateTime.parse(json['createdAt']),
    );
  }
}