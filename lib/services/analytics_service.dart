import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  static final AnalyticsService _instance = AnalyticsService._internal();
  factory AnalyticsService() => _instance;

  AnalyticsService._internal();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver get observer =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  Future<void> logSearch(String searchTerm) {
    return _analytics.logSearch(searchTerm: searchTerm);
  }

  Future<void> logLogin(String method) {
    return _analytics.logLogin(loginMethod: method);
  }

  Future<void> logSignUp(String method) {
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
