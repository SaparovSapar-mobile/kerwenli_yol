import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/notification.dart';
import 'package:kerwenli_yol/providers/database/user.dart';
import 'package:kerwenli_yol/services/api/notification.dart';

final Provider<NotificationApiService> notificationApiProvider =
    Provider<NotificationApiService>((ref) => NotificationApiService());

/// Свои уведомления. Пустой список, если пользователь не авторизован -
/// эндпоинт требует client_uuid.
final AutoDisposeFutureProvider<List<NotificationModel>>
fetchNotificationsProvider =
    FutureProvider.autoDispose<List<NotificationModel>>((ref) async {
      final String userUuid = await ref.watch(getUserIdProvider.future);
      if (userUuid.isEmpty) return [];

      return ref
          .read(notificationApiProvider)
          .fetchNotifications(userUuid: userUuid);
    });

/// Число непрочитанных для бейджа на колокольчике.
final AutoDisposeFutureProvider<int> unreadNotificationsProvider =
    FutureProvider.autoDispose<int>((ref) async {
      final String userUuid = await ref.watch(getUserIdProvider.future);
      if (userUuid.isEmpty) return 0;

      return ref
          .read(notificationApiProvider)
          .fetchUnreadCount(userUuid: userUuid);
    });
