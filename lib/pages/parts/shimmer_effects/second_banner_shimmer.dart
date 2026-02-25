import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class SecondBannerShimmer extends ConsumerWidget {
  const SecondBannerShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors ============
    final bool isLight = isLightTheme(context, ref);
    final Color highlightColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color imgColor = Color(0xff708798);

    final double colorOpacity = isLight ? 1 : .1;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Shimmer(
        colorOpacity: colorOpacity,
        child: Container(
          alignment: Alignment.center,
          width: double.maxFinite,
          height: banner1Height,
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
      ),
    );
  }
}
