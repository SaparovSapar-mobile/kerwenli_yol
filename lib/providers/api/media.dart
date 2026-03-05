import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/default_params.dart';
import 'package:kerwenli_yol/models/media.dart';
import 'package:kerwenli_yol/services/api/media.dart';

final Provider<MediaApiService> mediaApiProvider = Provider<MediaApiService>(
  (ref) => MediaApiService(),
);

final FutureProviderFamily<List<MediaModel>, DefaultParams>
fetchMediasProvider = FutureProvider.family<List<MediaModel>, DefaultParams>((
  ref,
  arg,
) async {
  List<MediaModel> datas = [];

  try {
    datas = await ref.read(mediaApiProvider).fetchMedias(arg);
  } catch (e) {
    rethrow;
  }

  return datas;
});
