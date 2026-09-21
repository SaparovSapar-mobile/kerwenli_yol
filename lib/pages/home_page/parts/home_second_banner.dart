import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/convert_and_sort.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/banner.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_banners/parts/home_banner.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/second_banner_shimmer.dart';
import 'package:kerwenli_yol/providers/api/banner.dart';
import 'package:kerwenli_yol/helpers/functions/responsive.dart';

class HomeSecondBanner extends ConsumerWidget {
  const HomeSecondBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<BannerModel>> resultApi = ref.watch(
      fetchBannersProvider,
    );

    return resultApi.when(
      data: (data) {
        if (data.isEmpty) return const SizedBox.shrink();

        final slots = sortBannerTypes(data);
        final slot4 = slots[3];

        // slot4 yoksa komple gizle
        if (slot4.isEmpty) return const SizedBox.shrink();

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: HomeBanner(
                isBig: true,
                banners: slot4,
                height: bannerHeight1(context),
                width: double.infinity,
                borderRadius: 8,
                dotsLeft: 4,
                dotsBottom: 4,
                dotsSize: 4.0,
                dotsActiveWidth: 9.0,
                dotsActiveHeight: 4.0,
              ),
            ),
            AppBarBottomLine(thickness: 10),
          ],
        );
      },
      error: (_, _) => const SizedBox.shrink(),
      loading: () => SecondBannerShimmer(),
    );
  }
}
