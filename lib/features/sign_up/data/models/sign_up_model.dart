class SignUpModel {
  final String email;
  final String password;

  SignUpModel({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
