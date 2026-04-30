import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/search.dart';
import 'package:kerwenli_yol/providers/pages/search_page.dart';
import 'package:kerwenli_yol/services/api/search.dart';

final Provider<SearchApiService> searchApiProvider = Provider<SearchApiService>(
  (ref) => SearchApiService(),
);

final FutureProvider<SearchModel> fetchSearchProvider =
    FutureProvider<SearchModel>((ref) async {
      SearchModel result = SearchModel.defaultValue();

      try {
        final String q = ref.watch(eCommerceSearchProvider);
        result = await ref.read(searchApiProvider).fetchSearch(q);
      } catch (e) {
        rethrow;
      }

      return result;
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
