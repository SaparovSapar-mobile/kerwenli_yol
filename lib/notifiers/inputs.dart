import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesNotifier extends StateNotifier<List<int>> {
  CategoriesNotifier() : super([]);

  Future<void> addOrRemoveCategory(int category) async {
    if (!state.contains(category)) {
      state = [...state, category];
    } else {
      state = state.where((i) => i != category).toList();
    }
  }

  Future<void> setCategories(List<int> categories) async {
    state = categories;
  }

  Future<void> removeAll() async {
    state = [];
  }
}
