import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/pages/bottom_navigation_page.dart';
import 'package:kerwenli_yol/pages/onboard_page/onboard_page.dart';
import 'package:kerwenli_yol/pages/main_pass_code_page/main_pass_code_page.dart';
import 'package:kerwenli_yol/pages/splash_page/splash_page.dart';
import 'package:kerwenli_yol/providers/database/user.dart';
import 'package:kerwenli_yol/providers/pages/settings_page.dart';
import 'package:kerwenli_yol/providers/settings.dart';
import 'package:kerwenli_yol/services/analytics_service.dart';
import 'package:kerwenli_yol/services/notification_service.dart';

/// Сколько держим сплеш перед тем, как пустить пользователя в приложение.
const Duration splashDuration = Duration(seconds: 2);

class AppHome extends ConsumerStatefulWidget {
  const AppHome({super.key});

  @override
  ConsumerState<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends ConsumerState<AppHome> {
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    _restoreSession();
    // не через Navigator: подмена внутри одного виджета не даёт
    // лишней анимации перехода и не ломает диплинки
    Future.delayed(splashDuration, () {
      if (mounted) setState(() => _showSplash = false);
    });
  }

  /// Сессия хранится в локальной БД, поэтому после перезапуска ни Firebase
  /// Analytics, ни сервер пушей про пользователя не знают - восстанавливаем.
  /// Пустой id означает "не авторизован".
  Future<void> _restoreSession() async {
    try {
      final String userId = await ref.read(getUserIdProvider.future);
      if (userId.isEmpty) return;

      await AnalyticsService().setUserId(userId);
      // токен устройства мог протухнуть или смениться после переустановки
      await NotificationService().registerDeviceOnServer(userId);
    } catch (_) {
      // аналитика и пуши не должны мешать запуску приложения
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_showSplash) return const SplashPage();

    final bool isFirstTime = ref.read(isFirstTimeProvider);
    final int passCode = ref.read(passCodeProvider);

    final bool hasPassCode = passCode != 0;

    if (isFirstTime) {
      return const OnboardPage();
    } else if (hasPassCode) {
      return MainPassCodePage();
    } else {
      return const BottomNavigationPage();
    }
  }
}
