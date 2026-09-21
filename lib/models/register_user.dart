import 'package:equatable/equatable.dart';

class RegisterUserModel {
  final String name, password, phone, email;

  RegisterUserModel({
    required this.name,
    required this.password,
    required this.phone,
    this.email = '',
  });

  /// Регистрация по email: код уходит письмом.
  bool get isByEmail => email.trim().isNotEmpty;

  String get _normalizedPhone {
    final String p = phone.trim();
    if (p.isEmpty) return '';
    return p.startsWith('+993') ? p : '+993$p';
  }

  /// POST /client/register
  Map<String, dynamic> toEmailJson() {
    return {
      'name': name,
      'password': password,
      'email': email.trim(),
      'phone': _normalizedPhone,
    };
  }

  /// POST /client/phone/register
  Map<String, dynamic> toPhoneJson() {
    return {'name': name, 'password': password, 'phone': _normalizedPhone};
  }

  Map<String, dynamic> toJson() => isByEmail ? toEmailJson() : toPhoneJson();
}

class ResultRegister extends Equatable {
  final bool success;
  final String? message;

  const ResultRegister({required this.success, this.message});

  factory ResultRegister.defaultResult() {
    return ResultRegister(success: false, message: '');
  }

  @override
  List<Object?> get props => [success, message];
}
