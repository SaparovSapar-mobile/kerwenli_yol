import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/providers/pages/categories_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class HeadCategoryButtons extends ConsumerWidget {
  const HeadCategoryButtons({super.key, required this.categories});

  final List<String> categories;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
    TextStyle textStyle = AppTextStyles.semiBold12;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ButtonsTabBar(
        contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
        backgroundColor: activeBgColor,
        unselectedBackgroundColor: bgColor,
        borderColor: activeBgColor,
        unselectedBorderColor: borderColor,
        borderWidth: 1,
        labelStyle: textStyle.copyWith(color: activeTextColor),
        unselectedLabelStyle: textStyle.copyWith(color: textColor),
        tabs: categories.map((e) => Tab(text: e)).toList(),
        onTap: (v) => ref.read(headerCategoryIndexProvider.notifier).state =
            categories[v],
      ),
    );
  }
}
