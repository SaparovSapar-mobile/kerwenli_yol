class ForgotModel {
  final String login;

  ForgotModel({required this.login});

  Map<String, dynamic> toJson() {
    return {'login': login};
  }
}
