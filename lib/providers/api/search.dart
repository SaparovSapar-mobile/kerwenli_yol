import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/search.dart';
import 'package:kerwenli_yol/providers/pages/search_page.dart';
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

      return result;
    });
