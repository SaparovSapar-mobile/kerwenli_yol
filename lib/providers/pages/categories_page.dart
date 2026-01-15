import 'package:flutter_riverpod/flutter_riverpod.dart';

var categoryProvider = StateProvider<String>((ref) => '');

var categoryFilterIndexProvider = StateProvider<int>((ref) => 0);

var headerCategoryIndexProvider = StateProvider<int>((ref) => 0);
