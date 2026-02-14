import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class HomeBestCompanyShimmerCard extends ConsumerWidget {
  const HomeBestCompanyShimmerCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors ============
    bool isLight = isLightTheme(context, ref);
    Color highlightColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    Color imgColor = Color(0xff708798);

    double colorOpacity = isLight ? 1 : .1;

    return SizedBox(
      width: 88.57925415039062,
      child: Shimmer(
        colorOpacity: colorOpacity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: highlightColor,
              ),
              child: Image.asset(
                'assets/images/shimmer_logo.png',
                color: imgColor,
              ),
            ),
            SizedBox(height: 2),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 12,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: highlightColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(height: 2),
                  Container(
                    height: 12,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: highlightColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
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
