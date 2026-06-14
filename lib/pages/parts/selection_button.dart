import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class SelectionButton extends ConsumerWidget {
  const SelectionButton({
    super.key,
    required this.title1,
    required this.title2,
    this.horizontalMargin,
  });

  final String 
  title1,
   title2;
  final double? horizontalMargin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors =========
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color subBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    // ======== Text Styles =========
    final TextStyle titleStyle1 = AppTextStyles.semiBold12.copyWith(
      color: isLight ? LightColors.textTitleLight : DarkColors.textTitleDark,
    );
    final TextStyle titleStyle2 = AppTextStyles.semiBold12.copyWith(
      color: isLight
          ? LightColors.textDescriptionLight
          : DarkColors.textDescriptionDark,
    );

    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin ?? 16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TabBar(
        padding: EdgeInsets.all(4),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          color: subBgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle: titleStyle1,
        unselectedLabelStyle: titleStyle2,
        tabs: [
          Text(title1),
         Text(title2)],
      ),
    );
  }
}
