import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/product.dart';
import 'package:kerwenli_yol/models/search.dart';
import 'package:kerwenli_yol/providers/api/product.dart';
import 'package:kerwenli_yol/providers/database/user.dart';
import 'package:kerwenli_yol/providers/pages/search_page.dart';
import 'package:kerwenli_yol/services/api/product.dart';
import 'package:kerwenli_yol/services/api/search.dart';

final Provider<SearchApiService> searchApiProvider = Provider<SearchApiService>(
  (ref) => SearchApiService(),
);

final AutoDisposeFutureProvider<SearchModel> fetchSearchProvider =
    FutureProvider.autoDispose<SearchModel>((ref) async {
      final String q = ref.watch(eCommerceSearchProvider);

      // Не делай запрос если строка пустая
      if (q.trim().isEmpty) {
        return SearchModel.defaultValue();
      }

      try {
        return await ref.read(searchApiProvider).fetchSearch(q);
      } catch (e) {
        rethrow;
      }
    });

final AutoDisposeFutureProviderFamily<SearchModel?, File> visualSearchProvider =
    FutureProvider.autoDispose.family<SearchModel?, File>((ref, arg) async {
      SearchModel? result;

      try {
        result = await ref.read(searchApiProvider).visualSearch(arg);
      } catch (e) {
        rethrow;
      }

      if (result == null || result.products.isEmpty) return result;

      // /client/visual-search не отдаёт по товарам views_count, likes_count,
      // is_liked и category_name - на карточке были нули и пустая плашка.
      // Полный список тут не поможет: /client/products режет выдачу на 100,
      // а товаров больше, и старые в первую сотню не попадают.
      // Поэтому добираем каждый товар по uuid, параллельно.
      // Порядок visual-search сохраняем: это ранжирование по схожести.
      try {
        final String userId = await ref.read(getUserIdProvider.future);
        final ProductApiService api = ref.read(productApiProvider);

        final List<ProductModel> enriched = await Future.wait(
          result.products.map((ProductModel p) async {
            if (p.id.isEmpty) return p;
            try {
              final ProductModel full = await api.fetchProduct(p.id, userId);
              // при ошибке fetchProduct отдаёт пустую модель - берём исходную,
              // чтобы не потерять название и картинку
              return full.id.isEmpty ? p : full;
            } catch (_) {
              return p;
            }
          }),
        );

        result = SearchModel(
          query: result.query,
          products: enriched,
          companies: result.companies,
          news: result.news,
          marks: result.marks,
          media: result.media,
        );
      } catch (_) {
        // не удалось добрать - показываем что есть, без счётчиков
      }

      return result;
    });
