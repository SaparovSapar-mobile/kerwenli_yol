import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/mark_type.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class HpsTabs extends ConsumerWidget {
  const HpsTabs({super.key, required this.tabCtrl, required this.markTypes});

  final TabController tabCtrl;
  final List<MarkTypeModel> markTypes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);

    final Color activeBgColor = isLight
        ? LightColors.primary
        : DarkColors.primary;
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color activeTextColor = isLight
        ? LightColors.textTitleDark
        : DarkColors.textTitleLight;
    final Color textColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    final TextStyle textStyle = AppTextStyles.regular10;

    return Container(
      height: homeMarkTypeHeight,
      padding: const EdgeInsets.only(left: 16, bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ButtonsTabBar(
          controller: tabCtrl,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 8,
          ),
          backgroundColor: activeBgColor,
          unselectedBackgroundColor: bgColor,
          labelStyle: textStyle.copyWith(color: activeTextColor),
          unselectedLabelStyle: textStyle.copyWith(color: textColor),
          borderWidth: 0,
          radius: 16,
          tabs: [
            const Tab(text: 'Hemmesi'),
            ...markTypes.map((item) {
              final String name = translateText(
                ref,
                item.nameTm,
                item.nameRu,
                item.nameEn,
                item.nameEn,
              );

              return Tab(text: name);
            }),
          ],
        ),
      ),
    );
  }
}
