import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/company_page/company_page.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/home_vip_company_card_image.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/company_status.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_card_categories.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_rating.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class HomeVipCompanyCard extends ConsumerWidget {
  const HomeVipCompanyCard({
    super.key,
    this.isFirst,
    this.isLast,
    required this.cardTopTypes,
    required this.company,
  });

  final bool? isFirst, isLast;
  final List<String> cardTopTypes;
  final CompanyModel company;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors ============
    final bool isLight = isLightTheme(context, ref);
    final Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;

    // ======== Text Styles ============
    final TextStyle nameStyle = AppTextStyles.medium12;

    EdgeInsetsGeometry? margin;
    if (isFirst != null && isLast != null) {
      margin = EdgeInsets.only(
        left: isFirst! ? 16 : 0,
        right: isLast! ? 16 : 0,
      );
    }

    final String name = translateText(
      ref,
      company.nameTm,
      company.nameRu,
      company.nameEn,
      company.nameEn,
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => goToPage(
        context,
        CompanyPage(companyId: company.individualUuid),
        AxisDirection.left,
      ),
      child: Container(
        width: vipCompanyCardWidth,
        margin: margin,
        padding: EdgeInsets.only(left: 6, top: 12, right: 6, bottom: 6),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeVipCompanyCardImage(
              cardTopTypes: cardTopTypes,
              company: company,
            ),
            SizedBox(height: 5),
            SizedBox(
              height: 27,
              child: Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: nameStyle,
              ),
            ),
            CompanyStatus(isOpen: false),
            SizedBox(height: 2),
            HomeVipCompanyCardCategories(),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ViewCount(viewCount: company.viewsCount,), HomeVipCompanyRating()],
            ),
          ],
        ),
      ),
    );
  }
}
