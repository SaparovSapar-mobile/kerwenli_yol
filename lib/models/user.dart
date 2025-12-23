class UserModel {
  final String id, email, name, phone, token;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['uuid'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      token: json['token'],
    );
  }

  factory UserModel.defaultValue() {
    return UserModel(id: '', email: '', name: '', phone: '', token: '');
  }
}
