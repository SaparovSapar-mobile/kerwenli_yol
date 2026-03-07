import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/models/default_params.dart';
import 'package:kerwenli_yol/models/sponsor.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_partners/parts/home_partner_list.dart';
import 'package:kerwenli_yol/pages/parts/home_more_button.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/home_sponsors_shimmer/home_sponsors_shimmer.dart';
import 'package:kerwenli_yol/providers/api/sponsor.dart';

class HomePartners extends ConsumerWidget {
  const HomePartners({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DefaultParams arg = DefaultParams(page: 1, pageSize: 10);
    final AsyncValue<List<SponsorModel>> resultApi = ref.watch(
      fetchSponsorsProvider(arg),
    );

    return resultApi.when(
      data: (data) {
        if (data.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HomeMoreButton(text: 'Hyzmadaslarymyz', onTap: () {}),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: HomePartnerList(sponsors: data),
            ),
            AppBarBottomLine(thickness: 10),
          ],
        );
      },
      error: (_, _) => const SizedBox.shrink(),
      loading: () => HomeSponsorsShimmer(),
    );
  }
}
