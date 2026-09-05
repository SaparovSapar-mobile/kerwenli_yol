import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/helpers/methods/static_data.dart';

class ProfileApiService {
  /// PUT /client/profile - обновление профиля клиента.
  /// Сервер принимает частичный payload (нужно минимум одно поле),
  /// поэтому меняем только имя, номер телефона не трогаем.
  Future<bool> updateProfileName({
    required String userUuid,
    required String name,
  }) async {
    final Uri uri = Uri.parse('$apiUrl/client/profile');

    try {
      final http.Response response = await http.put(
        uri,
        headers: {'Content-Type': 'application/json', 'X-User-UUID': userUuid},
        body: json.encode({'name': name}),
      );
      final dynamic jsonData = json.decode(response.body);

      return response.statusCode == 200 && jsonData['status'];
    } catch (e) {
      rethrow;
    }
  }
}
