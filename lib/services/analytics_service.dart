import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  static final AnalyticsService _instance = AnalyticsService._internal();
  factory AnalyticsService() => _instance;

  AnalyticsService._internal();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  /// Один обсервер на всё приложение. Раньше это был геттер, который создавал
  /// новый FirebaseAnalyticsObserver при каждом обращении, а MyApp.build
  /// перезапускается при смене темы и языка.
  late final FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
    analytics: _analytics,
  );

  /// uuid, для которых событие уже отправлено в этой сессии - защита от
  /// повторного нажатия кнопки и повторной проверки OTP.
  String? _lastSignUpId;
  String? _lastLoginId;

  /// Только внутренний uuid из бэкенда. Телефон, имя и почту сюда передавать
  /// нельзя - это персональные данные, правила Google их запрещают.
  /// null - пользователь вышел из аккаунта.
  Future<void> setUserId(String? id) {
    final String? value = (id == null || id.isEmpty) ? null : id;
    if (value == null) {
      _lastSignUpId = null;
      _lastLoginId = null;
    }
    return _analytics.setUserId(id: value);
  }

  Future<void> logScreen(String name) {
    return _analytics.logScreenView(screenName: name);
  }

  Future<void> logSearch(String searchTerm) {
    return _analytics.logSearch(searchTerm: searchTerm);
  }

  Future<void> logLogin(String method, {String? userId}) {
    if (userId != null && userId.isNotEmpty) {
      if (_lastLoginId == userId) return Future.value();
      _lastLoginId = userId;
    }
    return _analytics.logLogin(loginMethod: method);
  }

  Future<void> logSignUp(String method, {String? userId}) {
    if (userId != null && userId.isNotEmpty) {
      if (_lastSignUpId == userId) return Future.value();
      _lastSignUpId = userId;
    }
    return _analytics.logSignUp(signUpMethod: method);
  }

  Future<void> logViewCompany({
    required String companyId,
    required String companyName,
    String? categoryName,
  }) {
    return _analytics.logSelectContent(
      contentType: 'company',
      itemId: companyId,
      parameters: {
        'item_name': companyName,
        if (categoryName != null) 'category_name': categoryName,
      },
    );
  }

  Future<void> logViewProduct({
    required String productId,
    required String productName,
    String? companyName,
  }) {
    return _analytics.logSelectContent(
      contentType: 'product',
      itemId: productId,
      parameters: {
        'item_name': productName,
        if (companyName != null) 'company_name': companyName,
      },
    );
  }

  Future<void> logToggleBookmark({
    required bool added,
    required String contentType,
    required String itemId,
  }) {
    return _analytics.logEvent(
      name: added ? 'add_to_wishlist' : 'remove_from_wishlist',
      parameters: {'content_type': contentType, 'item_id': itemId},
    );
  }

  Future<void> logToggleFollow({
    required bool followed,
    required String companyId,
  }) {
    return _analytics.logEvent(
      name: followed ? 'follow_company' : 'unfollow_company',
      parameters: {'company_id': companyId},
    );
  }
}
