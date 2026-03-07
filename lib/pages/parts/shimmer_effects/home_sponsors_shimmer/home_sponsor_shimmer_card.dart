import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/shimmer_container.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class HomeSponsorShimmerCard extends ConsumerWidget {
  const HomeSponsorShimmerCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors ============
    final bool isLight = isLightTheme(context, ref);
    final Color highlightColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color imgColor = Color(0xff708798);

    final double colorOpacity = isLight ? 1 : .1;

    return Container(
      width: homeSponsorsWidth,
      padding: EdgeInsets.all(6),
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
                  ShimmerContainer(height: 12, width: 108.50108337402344),
                  ShimmerContainer(height: 12, width: 80),
                  ShimmerContainer(height: 12, width: 56),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
