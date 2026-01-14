import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class CompanyPagePOrSTabbar extends ConsumerWidget {
  const CompanyPagePOrSTabbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color labelColor = isLight ? LightColors.primary : DarkColors.primary;
    Color unselectedLabelColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
    Color overlayColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    TextStyle labelStyle = AppTextStyles.semiBold12;

    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: TabBar(
        labelPadding: EdgeInsets.all(10),
        dividerColor: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 16),
        indicatorColor: labelColor,
        overlayColor: WidgetStatePropertyAll(overlayColor),
        labelStyle: labelStyle.copyWith(color: labelColor),
        unselectedLabelStyle: labelStyle.copyWith(color: unselectedLabelColor),
        tabs: [
          Text('Kategoriya 1', textAlign: TextAlign.center),
          Text('Kategoriya 1', textAlign: TextAlign.center),
          Text('Kategoriya 1', textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
