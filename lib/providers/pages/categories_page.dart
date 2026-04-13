import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<String> categoryProvider = StateProvider<String>(
  (ref) => '',
);

final StateProvider<List<int>> categoriesFilterIndexProvider =
    StateProvider<List<int>>((ref) => []);

final StateProvider<String> headerCategoryIndexProvider = StateProvider<String>(
  (ref) => '',
);
