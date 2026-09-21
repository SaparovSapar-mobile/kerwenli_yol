import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/company_page/company_page.dart';

/// Ключ навигатора нужен, чтобы открывать страницы из обработчика ссылок,
/// то есть снаружи дерева виджетов.
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

/// Схема приложения и домен сайта - и то и другое ведёт на карточку компании:
///   `tajirtrade://company/<uuid>`
///   `https://tajirtrade.com.tm/companies/<uuid>`
const String appScheme = 'tajirtrade';
const String webHost = 'tajirtrade.com.tm';

/// Ссылка, которая зашивается в QR-код компании.
String companyDeepLink(String companyId) => '$appScheme://company/$companyId';

/// Слушает входящие ссылки (и холодный старт, и когда приложение уже открыто)
/// и переводит их в переход на нужный экран.
class DeepLinkService {
  DeepLinkService._();

  static final DeepLinkService instance = DeepLinkService._();

  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _subscription;

  /// ссылка, пришедшая до того, как навигатор был готов
  Uri? _pending;

  /// чтобы одну и ту же ссылку не открыть дважды
  String? _lastHandled;

  Future<void> init() async {
    // повторная инициализация не нужна
    if (_subscription != null) return;

    _subscription = _appLinks.uriLinkStream.listen(
      _handleUri,
      onError: (Object e) => debugPrint('DeepLink error: $e'),
    );

    // холодный старт: приложение запустили самой ссылкой, поток её не отдаёт
    try {
      final Uri? initial = await _appLinks.getInitialLink();
      if (initial != null) _handleUri(initial);
    } catch (e) {
      debugPrint('DeepLink initial error: $e');
    }
  }

  void dispose() {
    _subscription?.cancel();
    _subscription = null;
  }

  void _handleUri(Uri uri) {
    final String? companyId = _companyIdFrom(uri);
    if (companyId == null || companyId.isEmpty) return;

    if (_lastHandled == uri.toString()) return;

    final NavigatorState? navigator = rootNavigatorKey.currentState;
    if (navigator == null) {
      // приложение ещё не построило первый кадр - откроем сразу после него
      _pending = uri;
      WidgetsBinding.instance.addPostFrameCallback((_) => _flushPending());
      return;
    }

    _lastHandled = uri.toString();
    navigator.push(
      MaterialPageRoute(builder: (_) => CompanyPage(companyId: companyId)),
    );
  }

  void _flushPending() {
    final Uri? uri = _pending;
    if (uri == null) return;
    _pending = null;
    _handleUri(uri);
  }

  /// Достаёт uuid компании из обеих поддерживаемых форм ссылки.
  String? _companyIdFrom(Uri uri) {
    // tajirtrade://company/UUID  -> host = "company", segments = [uuid]
    if (uri.scheme == appScheme) {
      if (uri.host == 'company' && uri.pathSegments.isNotEmpty) {
        return uri.pathSegments.first;
      }
      return null;
    }

    // https://tajirtrade.com.tm/companies/UUID
    if (uri.host == webHost && uri.pathSegments.length >= 2) {
      if (uri.pathSegments.first == 'companies' ||
          uri.pathSegments.first == 'company') {
        return uri.pathSegments[1];
      }
    }
    return null;
  }
}
