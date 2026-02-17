import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class HomeVipCompanyShimmerCard extends ConsumerWidget {
  const HomeVipCompanyShimmerCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors ============
    final bool isLight = isLightTheme(context, ref);
    Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    Color highlightColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    Color imgColor = Color(0xff708798);

    double colorOpacity = isLight ? 1 : .1;

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
            Container(
              width: double.maxFinite,
              height: 14,
              decoration: BoxDecoration(
                color: highlightColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            SizedBox(height: 4),
            Container(
              width: 80,
              height: 14,
              decoration: BoxDecoration(
                color: highlightColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            SizedBox(height: 17),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 32,
                  height: 14,
                  decoration: BoxDecoration(
                    color: highlightColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Container(
                  width: 32,
                  height: 14,
                  decoration: BoxDecoration(
                    color: highlightColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
