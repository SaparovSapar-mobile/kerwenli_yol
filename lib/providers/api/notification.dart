import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/services/api/notification.dart';

final Provider<NotificationApiService> notificationApiProvider =
    Provider<NotificationApiService>((ref) => NotificationApiService());
