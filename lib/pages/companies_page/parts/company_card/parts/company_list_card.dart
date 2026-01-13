import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/enums/card_top_text_type.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/company_card/parts/company_card_image.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class CompanyListCard extends ConsumerWidget {
  const CompanyListCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    return Container(
      height: companyListCardHeight,
      padding: EdgeInsets.all(9),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          CompanyCardImage(
            cardTopTypes: [CardTopTextType.vip],
            height: 100,
            width: 100,
          ),
        ],
      ),
    );
  }
}
