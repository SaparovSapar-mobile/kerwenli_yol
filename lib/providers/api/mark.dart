import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/mark.dart';
import 'package:kerwenli_yol/services/api/mark.dart';

final Provider<MarkApiService> markApiProvider = Provider<MarkApiService>(
  (ref) => MarkApiService(),
);

final FutureProviderFamily<List<MarkModel>, String> fetchMarksProvider =
    FutureProvider.family<List<MarkModel>, String>((ref, arg) async {
      List<MarkModel> result = [];

      try {
        result = await ref.read(markApiProvider).fetchMarks(arg);
      } catch (e) {
        rethrow;
      }

      return result;
    });
