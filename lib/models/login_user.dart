class LoginUserModel {
  final String login, password;

  LoginUserModel({required this.login, required this.password});

  Map<String, dynamic> toJson() {
    return {'login': login, 'password': password};
  }
}
