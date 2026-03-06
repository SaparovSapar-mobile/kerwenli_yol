import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/shimmer_container.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class HomeVipCompanyShimmerCard extends ConsumerWidget {
  const HomeVipCompanyShimmerCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors ============
    final bool isLight = isLightTheme(context, ref);
    final Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color highlightColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color imgColor = Color(0xff708798);

    final double colorOpacity = isLight ? 1 : .1;

    return Container(
      width: 99.36233520507812,
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: borderColor),
      ),
      child: Shimmer(
        colorOpacity: colorOpacity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: highlightColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 44),
              child: Image.asset(
                'assets/images/shimmer_logo.png',
                color: imgColor,
              ),
            ),
            SizedBox(height: 4),
            ShimmerContainer(height: 14, width: double.maxFinite),
            SizedBox(height: 4),
            ShimmerContainer(height: 14, width: 80),
            SizedBox(height: 17),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerContainer(height: 14, width: 32),
                ShimmerContainer(height: 14, width: 32),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
