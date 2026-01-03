import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class CompanyFeatures extends ConsumerWidget {
  const CompanyFeatures({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    Color innerBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    TextStyle textStyle = AppTextStyles.semiBold12;

    return Container(
      padding: EdgeInsets.all(10),
      color: bgColor,
      child: Container(
        padding: EdgeInsetsGeometry.all(8),
        decoration: BoxDecoration(
          color: innerBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Amatlyklary', style: textStyle)],
        ),
      ),
    );
  }
}
