import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Открыто ли поле поиска в шапке страницы закладок
final StateProvider<bool> bookmarkSearchOpenProvider = StateProvider<bool>(
  (ref) => false,
);

/// Текст поиска по закладкам. Пустая строка - обычный список.
final StateProvider<String> bookmarkSearchProvider = StateProvider<String>(
  (ref) => '',
);
