import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/notification.dart';

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
        headers: {'Content-Type': 'application/json', 'X-User-UUID': userUuid},
        body: json.encode({'is_notification': isNotification}),
      );
      final dynamic jsonData = json.decode(response.body);

      return response.statusCode == 200 && jsonData['status'];
    } catch (e) {
      rethrow;
    }
  }

  /// GET /client/notifications/{uuid} - свои уведомления, новые сверху.
  /// Внимание: data здесь плоский массив, без обёртки items/total,
  /// хотя swagger рисует иначе. Общего количества сервер не отдаёт,
  /// поэтому конец списка определяем по "пришло меньше, чем просили".
  Future<List<NotificationModel>> fetchNotifications({
    required String userUuid,
    int page = 1,
    int pageSize = 20,
  }) async {
    final Uri uri = Uri.parse('$apiUrl/client/notifications/$userUuid').replace(
      queryParameters: {'p': page.toString(), 'l': pageSize.toString()},
    );

    try {
      final http.Response response = await http.get(uri);
      final dynamic jsonData = json.decode(response.body);

      if (_ok(response.statusCode) && jsonData['status'] == true) {
        final dynamic datas = jsonData['data'];
        if (datas is! List) return [];

        return datas
            .map<NotificationModel>((e) => NotificationModel.fromJson(e))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  /// GET /client/notifications/{uuid}/unread-count - число для бейджа
  /// на колокольчике. Ответ: {"data": {"unread": 1}}.
  Future<int> fetchUnreadCount({required String userUuid}) async {
    final Uri uri = Uri.parse(
      '$apiUrl/client/notifications/$userUuid/unread-count',
    );

    try {
      final http.Response response = await http.get(uri);
      final dynamic jsonData = json.decode(response.body);

      if (_ok(response.statusCode) && jsonData['status'] == true) {
        return (jsonData['data']?['unread'] as int?) ?? 0;
      }
      return 0;
    } catch (e) {
      // бейдж не должен ронять главную страницу
      return 0;
    }
  }

  /// POST /client/notifications/{uuid}/{notificationUuid}/read
  Future<bool> markAsRead({
    required String userUuid,
    required String notificationUuid,
  }) async {
    final Uri uri = Uri.parse(
      '$apiUrl/client/notifications/$userUuid/$notificationUuid/read',
    );

    try {
      final http.Response response = await http.post(uri);
      final dynamic jsonData = json.decode(response.body);
      return _ok(response.statusCode) && jsonData['status'] == true;
    } catch (e) {
      return false;
    }
  }

  /// POST /client/notifications/{uuid}/read-all
  Future<bool> markAllAsRead({required String userUuid}) async {
    final Uri uri = Uri.parse(
      '$apiUrl/client/notifications/$userUuid/read-all',
    );

    try {
      final http.Response response = await http.post(uri);
      final dynamic jsonData = json.decode(response.body);
      return _ok(response.statusCode) && jsonData['status'] == true;
    } catch (e) {
      return false;
    }
  }

  /// POST /admin/notifications/register-token - без него адресные пуши
  /// конкретному человеку не доходят, работает только рассылка на топик.
  Future<bool> registerDeviceToken({
    required String userUuid,
    required String token,
    required String platform,
  }) async {
    final Uri uri = Uri.parse('$apiUrl/admin/notifications/register-token');

    try {
      final http.Response response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'client_uuid': userUuid,
          'token': token,
          'platform': platform,
        }),
      );
      final dynamic jsonData = json.decode(response.body);
      return _ok(response.statusCode) && jsonData['status'] == true;
    } catch (e) {
      return false;
    }
  }

  /// Создание ресурса сервер отдаёт как 201, а не 200 - так уже было
  /// с обращениями из "Hat ýazmak".
  bool _ok(int code) => code >= 200 && code < 300;
}
