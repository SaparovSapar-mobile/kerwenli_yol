class CheckOtpModel {
  final String email, phone, otpCode;

  CheckOtpModel({
    required this.email,
    required this.phone,
    required this.otpCode,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {'code': otpCode};

    if (email.isNotEmpty) data['email'] = email;
    if (phone.isNotEmpty) data['phone'] = phone;

    return data;
  }
}
