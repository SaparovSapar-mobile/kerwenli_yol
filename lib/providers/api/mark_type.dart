import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/mark_type.dart';
import 'package:kerwenli_yol/services/api/mark_type.dart';

final Provider<MarkTypeApiService> markTypeApiProvider =
    Provider<MarkTypeApiService>((ref) => MarkTypeApiService());

final FutureProvider<List<MarkTypeModel>> fetchMarkTypesProvider =
    FutureProvider<List<MarkTypeModel>>((ref) async {
      List<MarkTypeModel> result = [];

      try {
        result = await ref.read(markTypeApiProvider).fetchMarkTypes();
      } catch (e) {
        rethrow;
      }

      return result;
    });
