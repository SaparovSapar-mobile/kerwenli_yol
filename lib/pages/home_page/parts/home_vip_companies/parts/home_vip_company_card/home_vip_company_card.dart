import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/home_vip_company_card_image.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class HomeVipCompanyCard extends ConsumerWidget {
  const HomeVipCompanyCard({super.key, this.isFirst, this.isLast});

  final bool? isFirst, isLast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    return Container(
      width: 112,
      margin: isFirst != null && isLast != null
          ? EdgeInsets.only(left: isFirst! ? 16 : 0, right: isLast! ? 16 : 0)
          : null,
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [HomeVipCompanyCardImage()],
      ),
    );
  }
}
