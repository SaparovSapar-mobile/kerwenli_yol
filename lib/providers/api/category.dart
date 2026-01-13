import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/category.dart';
import 'package:kerwenli_yol/services/api/category.dart';

final categoryApiProvider = Provider<CategoryApiService>(
  (ref) => CategoryApiService(),
);

var fetchCategoriesProvider = FutureProvider<List<CategoryModel>>((ref) async {
  List<CategoryModel> datas = [];

  try {
    datas = await ref.read(categoryApiProvider).fetchCategories();
  } catch (e) {
    rethrow;
  }

  return datas;
});
