import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/enums/card_top_text_type.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/company_card/parts/company_card_image.dart';
import 'package:kerwenli_yol/pages/company_page/company_page.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_card_categories.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class SearchCompanyCard extends ConsumerWidget {
  const SearchCompanyCard({super.key, required this.company});

  final CompanyModel company;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = isLightTheme(context, ref);
    final Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    final String name = translateText(
      ref,
      company.nameTm,
      company.nameRu,
      company.nameEn,
      company.nameEn,
    );

    final String category = translateText(
      ref,
      company.categoryName.tm,
      company.categoryName.ru,
      company.categoryName.en,
      company.categoryName.en,
    );

    return GestureDetector(
      onTap: () => goToPage(
        context,
        CompanyPage(companyId: company.uuid), // uuid напрямую, не individualUuid
        AxisDirection.left,
      ),
      child: Container(
        padding: EdgeInsets.only(left: 9, top: 18, right: 9, bottom: 0),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            CompanyCardImage(
              cardTopTypes: [],
              image: company.photo,
              companyId: company.uuid,
            ),
            SizedBox(height: 5),
            Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.medium16,
            ),
            SizedBox(height: 20),
            HomeVipCompanyCardCategories(
              iconSize: 10,
              category: category,
            ),
          ],
        ),
      ),
    );
  }
}