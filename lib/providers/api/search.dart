import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/search.dart';
import 'package:kerwenli_yol/services/api/search.dart';

final Provider<SearchApiService> searchApiProvider = Provider<SearchApiService>(
  (ref) => SearchApiService(),
);

final FutureProvider<List<SearchModel>> fetchSearchProvider =
    FutureProvider<List<SearchModel>>((ref) async {
      List<SearchModel> result = [];

      try {
        result = await ref.read(searchApiProvider).fetchSearch('m');
      } catch (e) {
        rethrow;
      }

      return result;
    });
