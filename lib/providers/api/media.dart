import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/default_params.dart';
import 'package:kerwenli_yol/models/media.dart';
import 'package:kerwenli_yol/providers/pages/medias_page.dart';
import 'package:kerwenli_yol/services/api/media.dart';

final Provider<MediaApiService> mediaApiProvider = Provider<MediaApiService>(
  (ref) => MediaApiService(),
);

final FutureProviderFamily<List<MediaModel>, DefaultParams>
fetchMediasProvider = FutureProvider.family<List<MediaModel>, DefaultParams>((
  ref,
  arg,
) async {
  List<MediaModel> result = [];

  try {
    result = await ref.read(mediaApiProvider).fetchMedias(arg);
    if (arg.page == 1) {
      ref.read(hasMediasProvider.notifier).state = result.isNotEmpty;
      ref.read(hasErrMediasProvider.notifier).state = false;
    }
  } catch (e) {
    ref.read(hasErrMediasProvider.notifier).state = e.toString().isNotEmpty;
  }

  ref.read(loadMediasProvider.notifier).state = false;
  return result;
});

final FutureProviderFamily<List<MediaModel>, MediaParams>
fetchMediasByCompanyIdProvider =
    FutureProvider.family<List<MediaModel>, MediaParams>((ref, arg) async {
      List<MediaModel> result = [];

      try {
        result = await ref.read(mediaApiProvider).fetchMediasByCompanyId(arg);
        if (arg.page == 1) {
          ref.read(hasCMediasProvider.notifier).state = result.isNotEmpty;
          ref.read(hasErrCMediasProvider.notifier).state = false;
        }
      } catch (e) {
        ref.read(hasErrCMediasProvider.notifier).state = e
            .toString()
            .isNotEmpty;
      }

      ref.read(loadCMediasProvider.notifier).state = false;
      return result;
    });
