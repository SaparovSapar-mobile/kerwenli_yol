import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class CardBookmarkButton extends ConsumerWidget {
  const CardBookmarkButton({
    super.key,
    this.bGColor,
    this.width,
    this.height,
    this.iconSize,
    this.borderRadius,
  });

  final Color? bGColor;
  final double? width, height, iconSize, borderRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========= Colors =========
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgBlogLight : DarkColors.bgBlogDark;
    if (bGColor != null) {
      bgColor = bGColor!;
    }
    Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    return Container(
      width: width ?? 21,
      height: height ?? 21,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(Icons.bookmark, size: iconSize ?? 12, color: iconColor),
    );
  }
}
