class UserModel {
  final String id, email, name, phone, token, image;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.token,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['uuid'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      token: json['token'],
      image: json['image'] ?? '',
    );
  }

  factory UserModel.defaultValue() {
    return UserModel(
      id: '',
      email: '',
      name: '',
      phone: '',
      token: '',
      image: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'token': token,
      'image': image,
    };
  }
}
