import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/category.dart';
import 'package:kerwenli_yol/providers/pages/categories_page.dart';
import 'package:kerwenli_yol/services/api/category.dart';

final Provider<CategoryApiService> categoryApiProvider =
    Provider<CategoryApiService>((ref) => CategoryApiService());

final FutureProvider<List<CategoryModel>> fetchCategoriesProvider =
    FutureProvider<List<CategoryModel>>((ref) async {
      List<CategoryModel> datas = [];

      try {
        datas = await ref.read(categoryApiProvider).fetchCategories();

        if (datas.isNotEmpty) {
          ref.read(categoryProvider.notifier).state = datas.first.id;
        }
      } catch (e) {
        rethrow;
      }

      return datas;
    });
