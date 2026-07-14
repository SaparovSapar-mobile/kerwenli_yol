import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class HomeVipCompanyRating extends ConsumerWidget {
  const HomeVipCompanyRating({
    super.key,
    this.bGColor,
    this.fontSize,
    this.rating,
  });

  final Color? bGColor;
  final double? fontSize;
  final double? rating;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    if (bGColor != null) {
      bgColor = bGColor!;
    }
    final Color iconColor = isLight ? LightColors.vipCard : DarkColors.vipCard;

    final TextStyle textStyle = AppTextStyles.medium10.copyWith(
      fontSize: fontSize ?? 8,
    );
    final String ratingText = rating != null
        ? rating!.toStringAsFixed(1)
        : '4.7';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(ratingText, style: textStyle),
          SizedBox(width: 5),
          Icon(Icons.star, size: fontSize ?? 8, color: iconColor),
        ],
      ),
    );
  }
}
