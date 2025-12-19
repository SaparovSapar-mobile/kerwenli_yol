class RegisterUserModel {
  final String email, name, password, phone;

  RegisterUserModel({
    required this.email,
    required this.name,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {'email': email, 'name': name, 'password': password, 'phone': phone};
  }
}
