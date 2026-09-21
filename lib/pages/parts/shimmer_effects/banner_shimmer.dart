import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:kerwenli_yol/helpers/functions/responsive.dart';

class BannerShimmer extends ConsumerWidget {
  const BannerShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors ============
    final bool isLight = isLightTheme(context, ref);
    final Color highlightColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color imgColor = Color(0xff708798);

    final double colorOpacity = isLight ? 1 : .1;
    final double width = (screenProperties(context).width - 42) / 2;

    return Shimmer(
      colorOpacity: colorOpacity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            width: double.maxFinite,
            height: bannerHeight1(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: highlightColor,
            ),
            child: Image.asset(
              'assets/images/shimmer_logo.png',
              width: 34.31355285644531,
              color: imgColor,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: width,
                height: bannerHeight2(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: highlightColor,
                ),
                child: Image.asset(
                  'assets/images/shimmer_logo.png',
                  width: 30,
                  color: imgColor,
                ),
              ),
              SizedBox(width: 10),
              Container(
                alignment: Alignment.center,
                width: width,
                height: bannerHeight2(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: highlightColor,
                ),
                child: Image.asset(
                  'assets/images/shimmer_logo.png',
                  width: 30,
                  color: imgColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
