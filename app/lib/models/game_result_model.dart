class GameResultModel {
  final String id;
  final String color;
  final DateTime date;

  GameResultModel({
    required this.id,
    required this.color,
    required this.date,
  });

  factory GameResultModel.fromJson(Map<String, dynamic> json) {
    return GameResultModel(
      id: json['_id'],
      color: json['color'],
      date: DateTime.parse(json['createdAt']),
    );
  }
}