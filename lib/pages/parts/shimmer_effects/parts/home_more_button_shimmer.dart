import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class HomeMoreButtonShimmer extends ConsumerWidget {
  const HomeMoreButtonShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors ============
    final bool isLight = isLightTheme(context, ref);
    Color highlightColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    double colorOpacity = isLight ? 1 : .1;

    return Shimmer(
      colorOpacity: colorOpacity,
      child: Container(
        width: 122,
        height: 18,
        decoration: BoxDecoration(
          color: highlightColor,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
