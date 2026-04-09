class UserModel {
  final String userId;
  final String name;
  final String email;

  UserModel({required this.userId, required this.name, required this.email});

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'name': name, 'email': email};
  }
}
