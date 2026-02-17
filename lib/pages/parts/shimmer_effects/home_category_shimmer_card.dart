import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class HomeCategoryShimmerCard extends ConsumerWidget {
  const HomeCategoryShimmerCard({super.key, this.isFirst, this.isLast});

  final bool? isFirst, isLast;

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

    return Shimmer(
      colorOpacity: colorOpacity,
      child: Container(
        margin: isFirst != null && isLast != null
            ? EdgeInsets.only(left: isFirst! ? 16 : 0, right: isLast! ? 16 : 0)
            : null,
        padding: EdgeInsets.only(left: 6),
        width: 132,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: borderColor),
          color: highlightColor,
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/images/shimmer_logo.png',
              width: 30,
              color: imgColor,
            ),
          ],
        ),
      ),
    );
  }
}
