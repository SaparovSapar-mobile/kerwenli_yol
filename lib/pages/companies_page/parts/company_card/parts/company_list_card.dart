import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/enums/card_top_text_type.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/models/translation.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/company_card/parts/company_card_image.dart';
import 'package:kerwenli_yol/pages/company_page/company_page.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/company_status.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_card_categories.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_rating.dart';
import 'package:kerwenli_yol/pages/parts/card_bookmark_button.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class CompanyListCard extends ConsumerWidget {
  const CompanyListCard({super.key, this.forBookMark, required this.company});

  final bool? forBookMark;
  final CompanyModel company;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //======== Colors ======
    final bool isLight = isLightTheme(context, ref);
    final Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color bookmarkIconColor = isLight
        ? LightColors.primary
        : DarkColors.primary;

    // ====== Text Styles =======
    final TextStyle nameStyle = AppTextStyles.medium16;

    final bool forBm = forBookMark != null && forBookMark!;

    // ====== Name ======
    final String name = translateText(
      ref,
      company.nameTm,
      company.nameRu,
      company.nameEn,
      company.nameEn,
    );

    final TranslationModel categoryName = company.categoryName;
    final String catName = translateText(
      ref,
      categoryName.tm,
      categoryName.ru,
      categoryName.en,
      categoryName.en,
    );

    return GestureDetector(
      onTap: () => goToPage(
        context,
        CompanyPage(companyId: company.individualUuid),
        AxisDirection.left,
      ),
      child: Container(
        height: companyListCardHeight,
        padding: EdgeInsets.only(left: 9, top: 18, right: 9, bottom: 9),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            CompanyCardImage(
              cardTopTypes: forBm ? [] : [CardTopTextType.vip],
              height: 100,
              width: 100,
              bookmarkButtonWith: 20,
              bookmarkButtonHeight: 20,
              bookmarkButtonIconSize: 12,
              bookmarkButtonBorderRadius: 4.3,
              forBookMark: forBm,
              image: company.photo,
              companyId: company.individualUuid,
            ),
            SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: nameStyle,
                          ),
                        ),
                        SizedBox(width: 5),
                        if (forBm)
                          CardBookmarkButton(
                            bGColor: bookmarkIconColor.withValues(alpha: .2),
                            icnColor: bookmarkIconColor,
                            iconSize: 16,
                            companyId: company.individualUuid,
                          )
                        else
                          const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  CompanyStatus(isOpen: false, fontSize: 9),
                  SizedBox(height: 2),
                  HomeVipCompanyCardCategories(
                    iconSize: 10,
                    mainAxisAlignment: MainAxisAlignment.start,
                    category: catName,
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ViewCount(fontSize: 12, viewCount: company.viewsCount,),
                      HomeVipCompanyRating(fontSize: 12),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
