import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/helpers/methods/static_data.dart';

class FaqApiService {
  /// Список FAQ - нужен, чтобы узнать uuid пункта про службу поддержки,
  /// к которому прикрепляется обращение из "Hat ýazmak".
  Future<List<dynamic>> fetchFaqs() async {
    final Uri uri = Uri.parse('$apiUrl/client/faqs');

    try {
      final http.Response response = await http.get(uri);
      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status'] == true) {
        return (jsonData['data'] as List?) ?? [];
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  /// POST /client/faqs/{uuid}/requests - обращение клиента.
  /// Админ видит его в разделе обращений и может ответить.
  Future<bool> sendFaqRequest({
    required String faqUuid,
    required String name,
    required String email,
    required String description,
  }) async {
    final Uri uri = Uri.parse('$apiUrl/client/faqs/$faqUuid/requests');

    try {
      final http.Response response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': name,
          'email': email,
          'description': description,
        }),
      );
      final dynamic jsonData = json.decode(response.body);

      // Сервер на создание обращения отвечает 201 Created, а не 200.
      // Из-за жёсткой проверки на 200 письмо уходило, но приложение
      // показывало "Näsazlyk ýüze çykdy".
      final bool ok = response.statusCode >= 200 && response.statusCode < 300;
      return ok && jsonData['status'] == true;
    } catch (e) {
      return false;
    }
  }
}
