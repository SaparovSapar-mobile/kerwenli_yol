import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/check_otp.dart';
import 'package:kerwenli_yol/models/login_user.dart';
import 'package:kerwenli_yol/models/register_user.dart';
import 'package:kerwenli_yol/models/send_otp.dart';
import 'package:kerwenli_yol/models/update_password.dart';
import 'package:kerwenli_yol/models/user.dart';

class UserApiService {
  // === Login User ===
  Future<UserModel> loginUser(LoginUserModel reqData) async {
    final Uri uri = Uri.parse('$apiUrl/client/login');
    print('============================= login');
    print('uri: $uri');
    print('reqData.toJson(): ${reqData.toJson()}');

    try {
      final http.Response response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(reqData.toJson()),
      );
      final dynamic jsonData = json.decode(response.body);
      print('statusCode: ${response.statusCode}');
      print('body: ${response.body}');
      if (response.statusCode == 200 && jsonData['status']) {
        final dynamic data = jsonData['data'];

        if (data != null) {
          return UserModel.fromJson(data);
        }

        return UserModel.defaultValue();
      }
      return UserModel.defaultValue();
    } catch (e) {
      rethrow;
    }
  }

  // === Confirm Phone OTP (Registration) ===
  Future<bool> confirmPhoneOtp({
    required String phone,
    required String code,
  }) async {
    final Uri uri = Uri.parse('$apiUrl/client/phone/confirm');

    try {
      final http.Response response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'phone': phone, 'code': code}),
      );

      print('confirmPhoneOtp status: ${response.statusCode}');
      print('confirmPhoneOtp body: ${response.body}');

      final dynamic jsonData = json.decode(response.body);
      final dynamic status = jsonData['status'];
      return response.statusCode == 200 &&
          (status == true || status == 'success');
    } catch (e) {
      print('confirmPhoneOtp ERROR: $e');
      rethrow;
    }
  }

  // === Check OTP for Email ===
  // === Check OTP for Email ===
  Future<bool> verifyEmail(CheckOtpModel reqData) async {
    final Uri uri = Uri.parse('$apiUrl/client/verify-email');

    try {
      final http.Response response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(reqData.toJson()),
      );

      // print('statusCode: ${response.statusCode}');
      // print('body: ${response.body}');

      final dynamic jsonData = json.decode(response.body);

      // Проверяем оба варианта — bool true ИЛИ строка 'success'
      final dynamic status = jsonData['status'];
      final bool isSuccess = status == true || status == 'success';

      print('status value: $status, isSuccess: $isSuccess');

      return response.statusCode == 200 && isSuccess;
    } catch (e) {
      print('verifyEmail ERROR: $e');
      rethrow;
    }
  }

  // === Register User ===
  Future<ResultRegister> registerUser(RegisterUserModel reqData) async {
    print('registerUser reqData: ${reqData.toJson()}');
    // Регистрация по email и по телефону - разные эндпоинты.
    // /client/phone/register шлёт код через SMS-шлюз и про email не знает,
    // поэтому при регистрации с почтой письмо не приходило вообще.
    final Uri uri = Uri.parse(
      reqData.isByEmail
          ? '$apiUrl/client/register'
          : '$apiUrl/client/phone/register',
    );

    try {
      final http.Response response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(reqData.toJson()),
      );
      final dynamic jsonData = json.decode(response.body);
      print("Status code: ${response.statusCode}");
      print('registerUser body: ${response.body}');
      print('jsonData status: ${jsonData['status']}');
      return ResultRegister(
        success: response.statusCode == 200 && jsonData['status'],
        message: jsonData['message'] ?? '',
      );
    } catch (e) {
      rethrow;
    }
  }

  // === Send Otp Code for Forgot Passoword ===
  Future<ResultRegister> forgotPass(ForgotModel reqData) async {
    final Uri uri = Uri.parse('$apiUrl/client/forgot-password');
    print('============================= sendOtp');
    print('uri: $uri');
    print('reqData.toJson(): ${reqData.toJson()}');

    try {
      final http.Response response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(reqData.toJson()),
      );
      print('response.body:: ${response.body}');
      final dynamic jsonData = json.decode(response.body);

      return ResultRegister(
        success: response.statusCode == 200 && jsonData['status'],
        message: jsonData['message'] ?? '',
      );
    } catch (e) {
      rethrow;
    }
  }

  // === Update Passoword ===
  Future<ResultRegister> updatePassword(UpdatePasswordModel reqData) async {
    final Uri uri = Uri.parse('$apiUrl/client/reset-password');

    try {
      final http.Response response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(reqData.toJson()),
      );
      final dynamic jsonData = json.decode(response.body);

      return ResultRegister(
        success: response.statusCode == 200 && jsonData['status'],
        message: jsonData['message'] ?? '',
      );
    } catch (e) {
      rethrow;
    }
  }
}
