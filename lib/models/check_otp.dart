class CheckOtpModel {
  final String email, phone, otpCode;

  CheckOtpModel({
    required this.email,
    required this.phone,
    required this.otpCode,
  });

  Map<String, dynamic> toJson() {
    return {'email': email, 'code': otpCode, 'phone': phone};
  }
}
