import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/providers/pages/categories_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class HeadCategoryCard extends ConsumerWidget {
  const HeadCategoryCard({super.key, required this.index, required this.text});

  final int index;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedCategory = ref.watch(headerCategoryIndexProvider);
    bool isActive = selectedCategory == index;

    // ====== Colors ======
    bool isLight = isLightTheme(context, ref);
    Color activeBgColor = isLight ? LightColors.primary : DarkColors.primary;
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;

    Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    Color activeTextColor = isLight
        ? LightColors.textTitleDark
        : DarkColors.textTitleLight;
    Color textColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    // ====== Text Styles ======
    TextStyle textStyle = AppTextStyles.semiBold12.copyWith(
      color: isActive ? activeTextColor : textColor,
    );

    return Container(
      padding: EdgeInsets.symmetric(vertical: 11, horizontal: 12),
      decoration: BoxDecoration(
        color: isActive ? activeBgColor : bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isActive ? activeBgColor : borderColor),
      ),
      child: Text(text, style: textStyle),
    );
  }
}
