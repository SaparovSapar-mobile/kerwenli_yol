import 'package:flutter/services.dart';

/// Вибрация при ошибке (неверный PIN и т.п.).
/// Используется системный HapticFeedback - без доп. пакетов и разрешений.
Future<void> errorVibration() async {
  await HapticFeedback.vibrate();
  await Future.delayed(const Duration(milliseconds: 120));
  await HapticFeedback.vibrate();
}
