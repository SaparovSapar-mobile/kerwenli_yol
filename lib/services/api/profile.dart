import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/helpers/methods/static_data.dart';

class ProfileApiService {
  /// GET /client/profile - текущее состояние уведомлений на сервере.
  /// Нужно, чтобы синхронизировать локальный переключатель при заходе
  /// с другого устройства (локально хранится только в SharedPreferences).
  /// Возвращает null при любой ошибке - тогда просто оставляем локальное
  /// значение как есть, не ломаем экран настроек.
  Future<bool?> getIsNotification({required String userUuid}) async {
    final Uri uri = Uri.parse('$apiUrl/client/profile');

    try {
      final http.Response response = await http.get(
        uri,
        headers: {'X-User-UUID': userUuid},
      );
      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status'] == true) {
        return jsonData['data']?['is_notification'] as bool?;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

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
