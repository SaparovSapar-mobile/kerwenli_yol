import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/enums/card_top_text_type.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/example_widgets/companies_page/parts/company_card/parts/exm_company_card_image.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/company_status.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_card_categories.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_rating.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class ExmCompanyCard extends ConsumerWidget {
  const ExmCompanyCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // =========== Colors ==============
    final bool isLight = isLightTheme(context, ref);
    Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    // =========== Text Styles ==============
    TextStyle nameStyle = AppTextStyles.medium16;

    return Container(
      padding: EdgeInsets.only(left: 9, top: 18, right: 9, bottom: 9),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExmCompanyCardImage(cardTopTypes: [CardTopTextType.vip]),
          SizedBox(height: 5),
          Text(
            'Türkmenistanda öndürilen şokaladlary alyn',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: nameStyle,
          ),
          CompanyStatus(isOpen: false, fontSize: 9),
          SizedBox(height: 2),
          HomeVipCompanyCardCategories(iconSize: 10),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ViewCount(fontSize: 12),
              HomeVipCompanyRating(fontSize: 12),
            ],
          ),
        ],
      ),
    );
  }
}
