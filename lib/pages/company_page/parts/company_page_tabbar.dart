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
    Color subBgColor = labelColor.withValues(alpha: .2);

    TextStyle labelStyle = AppTextStyles.semiBold12;

    return TabBar(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6.5),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorAnimation: TabIndicatorAnimation.elastic,
      dividerColor: Colors.transparent,
      indicator: BoxDecoration(
        color: subBgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      labelStyle: labelStyle.copyWith(color: labelColor),
      unselectedLabelStyle: labelStyle.copyWith(color: unselectedLabelColor),
      tabs: [
        CompanyPageTabbarTab(text: 'Info'),
        CompanyPageTabbarTab(text: 'Products'),
        CompanyPageTabbarTab(text: 'Media'),
      ],
    );
  }
}

class CompanyPageTabbarTab extends StatelessWidget {
  const CompanyPageTabbarTab({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsetsGeometry.all(10), child: Text(text));
  }
}
