class UpdatePasswordModel {
  final String code, newPassword;

  UpdatePasswordModel({required this.code, required this.newPassword});

  Map<String, dynamic> toJson() {
    return {'code': code, 'new_password': newPassword};
  }
}
