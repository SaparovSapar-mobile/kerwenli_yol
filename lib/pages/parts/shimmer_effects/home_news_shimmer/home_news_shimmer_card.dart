import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/shimmer_container.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class HomeNewsShimmerCard extends ConsumerWidget {
  const HomeNewsShimmerCard({super.key});

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
      width: 238,
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: borderColor),
      ),
      child: Shimmer(
        colorOpacity: colorOpacity,
        child: Row(
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
            SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerContainer(height: 20, width: double.maxFinite),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 2),
                    child: ShimmerContainer(
                      height: 10.418450355529785,
                      width: 44,
                    ),
                  ),
                  ShimmerContainer(height: 20, width: double.maxFinite),
                  SizedBox(height: 2),
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
          ],
        ),
      ),
    );
  }
}
