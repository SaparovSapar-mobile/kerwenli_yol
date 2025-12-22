import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class CardVirtualButton extends ConsumerWidget {
  const CardVirtualButton({
    super.key,
    this.bGColor,
    this.height,
    this.iconSize,
  });

  final Color? bGColor;
  final double? height, iconSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgBlogLight : DarkColors.bgBlogDark;
    if (bGColor != null) {
      bgColor = bGColor!;
    }
    Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    TextStyle textStyle = AppTextStyles.bold12;

    return Container(
      padding: EdgeInsets.all(5),
      height: height ?? 26,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/virtual.png',
            width: iconSize ?? 16,
            height: iconSize ?? 16,
            color: iconColor,
          ),
          SizedBox(width: 2),
          Text('360°', style: textStyle),
        ],
      ),
    );
  }
}
