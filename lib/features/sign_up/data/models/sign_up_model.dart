class SignUpModel {
  final String email;
  final String password;
  final String? name;

  SignUpModel({required this.email, required this.password, this.name});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }

  Map<String, dynamic> toJsonWithName() {
    return {'email': email, 'password': password, 'name': name};
  }
}
