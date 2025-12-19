import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/register_user.dart';

class UserApiServices {
  // === Register User ===
  Future<bool> registerUser(RegisterUserModel reqData) async {
    Uri uri = Uri.parse('$apiUrl/client/register');

    print('======================= registerUser');
    print('uri: $uri');
    print('reqData.toJson(): ${reqData.toJson()}');

    try {
      http.Response response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(reqData.toJson()),
      );
      print('response.statusCode: ${response.statusCode}');
      print('response.body: ${response.body}');
      var jsonData = json.decode(response.body);

      return response.statusCode == 200 && jsonData['status'];
    } catch (e) {
      rethrow;
    }
  }
}
