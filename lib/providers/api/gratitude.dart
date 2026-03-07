import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/default_params.dart';
import 'package:kerwenli_yol/models/gratitude.dart';
import 'package:kerwenli_yol/providers/pages/gratitudes_page.dart';
import 'package:kerwenli_yol/services/api/gratitude.dart';

final Provider<GratitudeApiService> gratitudeApiProvider =
    Provider<GratitudeApiService>((ref) => GratitudeApiService());

final FutureProviderFamily<List<GratitudeModel>, DefaultParams>
fetchGradtitudesProvider =
    FutureProvider.family<List<GratitudeModel>, DefaultParams>((
      ref,
      arg,
    ) async {
      List<GratitudeModel> result = [];

      try {
        result = await ref.read(gratitudeApiProvider).fetchGradtitudes(arg);
        if (arg.page == 1) {
          ref.read(hasGratitudesProvider.notifier).state = result.isNotEmpty;
          ref.read(hasErrGratitudesProvider.notifier).state = false;
        }
      } catch (e) {
        ref.read(hasErrGratitudesProvider.notifier).state = e
            .toString()
            .isNotEmpty;
      }

      ref.read(loadGratitudesProvider.notifier).state = false;
      return result;
    });

final AutoDisposeFutureProviderFamily<GratitudeModel, String>
fetchGratitudeDetailProvider = FutureProvider.autoDispose
    .family<GratitudeModel, String>((ref, arg) async {
      GratitudeModel result = GratitudeModel.defaultValue();

      try {
        result = await ref.read(gratitudeApiProvider).fetchGratitudeDetail(arg);
      } catch (e) {
        rethrow;
      }
      return result;
    });
