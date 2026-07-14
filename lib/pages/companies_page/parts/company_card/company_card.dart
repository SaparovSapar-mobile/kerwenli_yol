import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/enums/card_top_text_type.dart';
import 'package:kerwenli_yol/helpers/functions/company_status.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/company_card/parts/company_card_image.dart';
import 'package:kerwenli_yol/pages/company_page/company_page.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/company_status.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_card_categories.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_rating.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class CompanyCard extends ConsumerWidget {
  const CompanyCard({super.key, required this.company});

  final CompanyModel company;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // =========== Colors ==============
    final bool isLight = isLightTheme(context, ref);
    final Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    // =========== Text Styles ==============
    final TextStyle nameStyle = AppTextStyles.medium16;

    // ====== Name ======
    final String name = translateText(
      ref,
      company.nameTm,
      company.nameRu,
      company.nameEn,
      company.nameEn,
    );

    final bool isOpen = computeIsOpen(company);

    return GestureDetector(
      onTap: () => goToPage(
        context,
        CompanyPage(companyId: company.individualUuid),
        AxisDirection.left,
      ),
      child: Container(
        padding: EdgeInsets.only(left: 9, top: 18, right: 9, bottom: 9),
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
              companyId: company.individualUuid,
            ),
            SizedBox(height: 5),
            Expanded(
              child: Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: nameStyle,
              ),
            ),
            CompanyStatus(isOpen: isOpen, fontSize: 9),
            SizedBox(height: 2),
            HomeVipCompanyCardCategories(iconSize: 10),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ViewCount(fontSize: 12, viewCount: company.viewsCount,),
                HomeVipCompanyRating(fontSize: 12, rating: company.averageRating,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
