import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class CompanyPageTabbar extends ConsumerWidget {
  const CompanyPageTabbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color labelColor = isLight ? LightColors.gradus360 : DarkColors.gradus360;
    Color unselectedLabelColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionLight;

    TextStyle labelStyle = AppTextStyles.semiBold12;

    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent,
      labelStyle: labelStyle.copyWith(color: labelColor),
      unselectedLabelStyle: labelStyle.copyWith(color: unselectedLabelColor),
      tabs: [Text('Info'), Text('Products'), Text('Media')],
    );
  }
}
