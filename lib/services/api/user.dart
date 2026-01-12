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
    Uri uri = Uri.parse('$apiUrl/client/login');

    try {
      http.Response response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(reqData.toJson()),
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        var data = jsonData['data'];

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

  // === Check OTP for Email ===
  Future<bool> verifyEmail(CheckOtpModel reqData) async {
    Uri uri = Uri.parse('$apiUrl/client/verify-email');

    try {
      http.Response response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(reqData.toJson()),
      );
      var jsonData = json.decode(response.body);

      return response.statusCode == 200 && jsonData['status'];
    } catch (e) {
      rethrow;
    }
  }

  // === Register User ===
  Future<ResultRegister> registerUser(RegisterUserModel reqData) async {
    Uri uri = Uri.parse('$apiUrl/client/register');

    try {
      http.Response response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(reqData.toJson()),
      );
      var jsonData = json.decode(response.body);

      return ResultRegister(
        success: response.statusCode == 200 && jsonData['status'],
        message: jsonData['message'] ?? '',
      );
    } catch (e) {
      rethrow;
    }
  }

  // === Send Otp Code for Forgot Passoword ===
  Future<ResultRegister> sendOtp(SendOtpModel reqData) async {
    Uri uri = Uri.parse('$apiUrl/client/forgot-password');

    try {
      http.Response response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(reqData.toJson()),
      );
      var jsonData = json.decode(response.body);

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
    Uri uri = Uri.parse('$apiUrl/client/reset-password');

    try {
      http.Response response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(reqData.toJson()),
      );
      var jsonData = json.decode(response.body);

      return ResultRegister(
        success: response.statusCode == 200 && jsonData['status'],
        message: jsonData['message'] ?? '',
      );
    } catch (e) {
      rethrow;
    }
  }
}
