import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/providers/database/user.dart';
import 'package:kerwenli_yol/services/api/profile.dart';

final Provider<ProfileApiService> profileApiProvider =
    Provider<ProfileApiService>((ref) => ProfileApiService());

/// Значение is_notification на сервере - для синхронизации локального
/// переключателя (SharedPreferences хранит только на этом устройстве).
final AutoDisposeFutureProvider<bool?> serverIsNotificationProvider =
    FutureProvider.autoDispose<bool?>((ref) async {
      final String userUuid = await ref.read(getUserIdProvider.future);
      if (userUuid.isEmpty) return null;

      return ref.read(profileApiProvider).getIsNotification(userUuid: userUuid);
    });
