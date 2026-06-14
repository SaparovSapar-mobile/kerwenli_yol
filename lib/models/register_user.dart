import 'package:equatable/equatable.dart';

class RegisterUserModel {
  final String email, name, password, phone;

  RegisterUserModel({
    required this.email,
    required this.name,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'password': password,
      'phone': phone.startsWith('+993') ? phone : '+993$phone',
    };
  }
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
