class SendOtpModel {
  final String email, phone;

  SendOtpModel({required this.email, required this.phone});

  Map<String, dynamic> toJson() {
    return {'email': email, 'phone': phone};
  }
}
