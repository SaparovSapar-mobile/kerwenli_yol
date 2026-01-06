import 'package:flutter_riverpod/flutter_riverpod.dart';

var selectedCategoryIndexProvider = StateProvider<int>((ref) => 0);

var categoryFilterIndexProvider = StateProvider<int>((ref) => 0);
