class UserModel {
  final String userId;
  final String name;
  final String email;
  final List<String> favorites;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.favorites,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'favorites': favorites,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      name: json['name'],
      email: json['email'],
      favorites: (json['favorites'] as List<dynamic>).cast<String>(),
    );
  }
}
