import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

/// id приложения в магазинах
const String androidPackageId = 'tm.abb.tajirtrade';
const String appStoreId = '6760972108';

/// market:// открывает само приложение Play Market, минуя браузер
final Uri _playAppUri = Uri.parse('market://details?id=$androidPackageId');
final Uri _playWebUri = Uri.parse(
  'https://play.google.com/store/apps/details?id=$androidPackageId',
);

/// itms-apps:// - то же самое для App Store
final Uri _appStoreAppUri = Uri.parse(
  'itms-apps://itunes.apple.com/app/id$appStoreId',
);
final Uri _appStoreWebUri = Uri.parse(
  'https://apps.apple.com/app/id$appStoreId',
);

/// launchUrl кидает PlatformException, если обработчика нет,
/// поэтому каждая попытка идёт в своём try/catch
Future<bool> _tryLaunch(Uri uri, LaunchMode mode) async {
  try {
    return await launchUrl(uri, mode: mode);
  } catch (_) {
    return false;
  }
}

/// Открывает страницу приложения в Play Market / App Store.
/// Если магазина нет на устройстве - открывает ту же страницу в браузере.
/// Возвращает false, только если не открылось вообще ничего.
Future<bool> openStorePage() async {
  final bool isIOS = Platform.isIOS;
  final Uri appUri = isIOS ? _appStoreAppUri : _playAppUri;
  final Uri webUri = isIOS ? _appStoreWebUri : _playWebUri;

  // 1. Сначала https-ссылка в режиме externalNonBrowserApplication.
  //    Play Market и App Store ловят её как свою (verified app link) и
  //    открываются сразу, без окна "чем открыть" - Android иначе показывает
  //    ResolverActivity даже когда вариант всего один.
  if (await _tryLaunch(webUri, LaunchMode.externalNonBrowserApplication)) {
    return true;
  }

  // 2. Схема магазина - если https-ссылка не привязана к приложению
  if (await _tryLaunch(appUri, LaunchMode.externalApplication)) {
    return true;
  }

  // 3. Магазина нет вообще - открываем страницу в браузере
  return _tryLaunch(webUri, LaunchMode.externalApplication);
}
