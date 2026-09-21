import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Версия установленного приложения - берётся из pubspec во время сборки,
/// чтобы её не приходилось править руками в настройках.
final FutureProvider<String> appVersionProvider = FutureProvider<String>((
  ref,
) async {
  try {
    final PackageInfo info = await PackageInfo.fromPlatform();
    return info.version;
  } catch (_) {
    return '';
  }
});
