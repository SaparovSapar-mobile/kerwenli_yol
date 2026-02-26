import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class HomeMediaCardShimmer extends ConsumerWidget {
  const HomeMediaCardShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors ============
    final bool isLight = isLightTheme(context, ref);
    final Color highlightColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color imgColor = Color(0xff708798);

    final double colorOpacity = isLight ? 1 : .1;

    return SizedBox(
      width: 96.56488037109375,
      child: Shimmer(
        colorOpacity: colorOpacity,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: highlightColor,
          ),
          child: Image.asset('assets/images/shimmer_logo.png', color: imgColor),
        ),
      ),
    );
  }
}
