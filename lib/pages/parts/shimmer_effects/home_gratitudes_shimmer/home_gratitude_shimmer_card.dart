import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/shimmer_container.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class HomeGratitudeShimmerCard extends ConsumerWidget {
  const HomeGratitudeShimmerCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors ============
    final bool isLight = isLightTheme(context, ref);
    final Color highlightColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color imgColor = Color(0xff708798);
    final Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    final double colorOpacity = isLight ? 1 : .1;

    return Container(
      width: homeGratutitudeWidth,
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Shimmer(
        colorOpacity: colorOpacity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: highlightColor,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Image.asset(
                    'assets/images/shimmer_logo.png',
                    color: imgColor,
                  ),
                ),
                SizedBox(width: 5),
                ShimmerContainer(height: 12, width: 80),
              ],
            ),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerContainer(height: 10, width: 140),
                  ShimmerContainer(height: 10, width: 90),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerContainer(
                  height: 13.418450355529785,
                  width: 32.40073776245117,
                ),
                ShimmerContainer(
                  height: 13.418450355529785,
                  width: 32.40073776245117,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
