import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class CardFavoriteButton extends ConsumerWidget {
  const CardFavoriteButton({
    super.key,
    this.width,
    this.height,
    this.iconSize,
    this.borderRadius,
    this.rightPosition,
    this.topPosition,
  });

  final double? width,
      height,
      iconSize,
      borderRadius,
      rightPosition,
      topPosition;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======= Colors =======
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgBlogLight : DarkColors.bgBlogDark;
    Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    return Positioned(
      right: rightPosition ?? 4,
      top: topPosition ?? 4,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: width ?? 21,
          height: height ?? 21,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 4),
          ),
          child: Icon(
            Icons.favorite_border,
            size: iconSize ?? 12,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
