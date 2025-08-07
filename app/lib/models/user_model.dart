class UserModel {
  final String id;
  final String username;
  final double coins;

  UserModel({
    required this.id,
    required this.username,
    required this.coins,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      username: json['username'],
      coins: (json['coins'] ?? 0).toDouble(),
    );
  }
}