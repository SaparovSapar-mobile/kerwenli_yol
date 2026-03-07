import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/default_params.dart';
import 'package:kerwenli_yol/models/sponsor.dart';
import 'package:kerwenli_yol/providers/pages/sponsors_page.dart';
import 'package:kerwenli_yol/services/api/sponsor.dart';

final Provider<SponsorApiService> sponsorApiProvider =
    Provider<SponsorApiService>((ref) => SponsorApiService());

final FutureProviderFamily<List<SponsorModel>, DefaultParams>
fetchSponsorsProvider =
    FutureProvider.family<List<SponsorModel>, DefaultParams>((ref, arg) async {
      List<SponsorModel> result = [];

      try {
        result = await ref.read(sponsorApiProvider).fetchSponsors(arg);
        if (arg.page == 1) {
          ref.read(hasSponsorsProvider.notifier).state = result.isNotEmpty;
          ref.read(hasErrSponsorsProvider.notifier).state = false;
        }
      } catch (e) {
        ref.read(hasErrSponsorsProvider.notifier).state = e
            .toString()
            .isNotEmpty;
      }

      ref.read(loadSponsorsProvider.notifier).state = false;
      return result;
    });
