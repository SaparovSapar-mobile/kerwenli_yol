import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/media.dart';
import 'package:kerwenli_yol/services/api/media.dart';

final Provider<MediaApiService> mediaApiProvider = Provider<MediaApiService>(
  (ref) => MediaApiService(),
);

final FutureProvider<List<MediaModel>> fetchMediasProvider =
    FutureProvider<List<MediaModel>>((ref) async {
      List<MediaModel> datas = [];

      try {
        datas = await ref.read(mediaApiProvider).fetchMedias();
      } catch (e) {
        rethrow;
      }

      return datas;
    });
