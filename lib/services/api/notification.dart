import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/helpers/methods/static_data.dart';

class NotificationApiService {
  // update push notification preference =======
  Future<bool> updateNotificationPreference({
    required String userUuid,
    required bool isNotification,
  }) async {
    final Uri uri = Uri.parse('$apiUrl/client/notification-preference');

    try {
      final http.Response response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'X-User-UUID': userUuid,
        },
        body: json.encode({'is_notification': isNotification}),
      );
      final dynamic jsonData = json.decode(response.body);

      return response.statusCode == 200 && jsonData['status'];
    } catch (e) {
      rethrow;
    }
  }
}
