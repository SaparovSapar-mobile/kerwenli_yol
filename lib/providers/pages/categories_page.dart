import 'package:flutter_riverpod/flutter_riverpod.dart';

var categoryProvider = StateProvider<String>((ref) => '');

var categoriesFilterIndexProvider = StateProvider<List<int>>((ref) => []);

var headerCategoryIndexProvider = StateProvider<String>((ref) => '');
