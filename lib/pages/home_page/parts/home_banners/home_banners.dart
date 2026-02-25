import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/enums/banner_type.dart';
import 'package:kerwenli_yol/helpers/functions/convert_and_sort.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/banner.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_banners/parts/home_banner.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/banner_shimmer.dart';
import 'package:kerwenli_yol/providers/api/banner.dart';

class HomeBanners extends ConsumerWidget {
  const HomeBanners({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double width = (screenProperties(context).width - 42) / 2;

    final AsyncValue<List<BannerModel>> resultApi = ref.watch(
      fetchBannersProvider,
    );

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 10),
      child: resultApi.when(
        data: (data) {
          if (data.isEmpty) {
            return const SizedBox.shrink();
          }

          final List<List<BannerModel>> slots = sortBannerTypes(data);

          final List<BannerModel> slot1 = slots[0]; // Type1 alanı
          final List<BannerModel> slot2 = slots[1]; // Type2 alanı
          final List<BannerModel> slot3 = slots[2]; // Type3 alanı

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              HomeBanner(
                images: [],
                height: banner1Height,
                width: double.infinity,
                borderRadius: 8,
                dotsLeft: 7,
                dotsBottom: 5,
                dotsSize: 4.0,
                dotsActiveWidth: 9.0,
                dotsActiveHeight: 4.0,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  HomeBanner(
                    images: [],
                    height: banner2Height,
                    width: width,
                    borderRadius: 6,
                    dotsLeft: 4,
                    dotsBottom: 4,
                    dotsSize: 4.0,
                    dotsActiveWidth: 8.0,
                    dotsActiveHeight: 4.0,
                  ),
                  SizedBox(width: 10),
                  HomeBanner(
                    images: [],
                    height: banner2Height,
                    width: width,
                    borderRadius: 6,
                    dotsLeft: 4,
                    dotsBottom: 4,
                    dotsSize: 4.0,
                    dotsActiveWidth: 8.0,
                    dotsActiveHeight: 4.0,
                  ),
                ],
              ),
            ],
          );
        },
        error: (_, _) => const SizedBox.shrink(),
        loading: () => BannerShimmer(),
      ),
    );
  }
}
