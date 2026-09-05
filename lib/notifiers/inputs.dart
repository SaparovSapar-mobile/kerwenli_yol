import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubCategoryFiltersNotifier extends StateNotifier<List<String>> {
  SubCategoryFiltersNotifier() : super([]);

  void addOrRemove(String subCategoryId) {
    if (!state.contains(subCategoryId)) {
      state = [...state, subCategoryId];
    } else {
      state = state.where((i) => i != subCategoryId).toList();
    }
  }

  /// Hemmesi - выбрать/снять все подкатегории одной категории
  void toggleAll(List<String> subCategoryIds, bool select) {
    if (select) {
      final List<String> missing = subCategoryIds
          .where((i) => !state.contains(i))
          .toList();
      state = [...state, ...missing];
    } else {
      state = state.where((i) => !subCategoryIds.contains(i)).toList();
    }
  }

  void removeAll() => state = [];
}

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
