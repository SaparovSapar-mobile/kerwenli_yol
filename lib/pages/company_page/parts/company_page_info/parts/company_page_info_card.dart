import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/company_status.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/helpers/methods/image_and_video.dart';
import 'package:kerwenli_yol/helpers/methods/pages/bottom_sheets.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/models/translation.dart';
import 'package:kerwenli_yol/models/user.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/company_status.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_card_categories.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_rating.dart';
import 'package:kerwenli_yol/pages/login_page/login_page.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/providers/database/user.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class CompanyPageInfoCard extends ConsumerWidget {
  const CompanyPageInfoCard({super.key, required this.company});

  final CompanyDetailModel company;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======= Colors =======
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color bGColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    // ======= Text Styles =======
    final TextStyle textStyle = AppTextStyles.semiBold16;

    final MainInfoModel mainInfo = company.mainInfo;
    final TranslationModel compName = company.businessName;
    final TranslationModel catName = company.categoryName;
    final String name = translateText(
      ref,
      compName.tm,
      compName.ru,
      compName.en,
      compName.en,
    );
    final String categoryName = translateText(
      ref,
      catName.tm,
      catName.ru,
      catName.en,
      catName.en,
    );

    final bool isOpen = computeIsOpenFromWorkingTimes(company.workingTimes);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: showImageMethod(mainInfo.logoImg, 16, null),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: textStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5),
                HomeVipCompanyCardCategories(
                  mainAxisAlignment: MainAxisAlignment.start,
                  category: categoryName,
                ),
                SizedBox(height: 4),
                CompanyStatus(isOpen: isOpen),
                SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ViewCount(bGColor: bGColor, viewCount: company.viewsCount),
                    GestureDetector(
                      onTap: () async {
                        final UserModel resultDb = await ref.read(
                          getUserProvider.future,
                        );
                        final bool hasUser = resultDb.id != '';

                        if (!context.mounted) return;

                        if (!hasUser) {
                          goToPage(
                            context,
                            LoginPage(),
                            AxisDirection.left,
                            name: 'login',
                          );
                          return;
                        }

                        showRateCompanyBottomSheet(context, company.id);
                      },
                      child: HomeVipCompanyRating(
                        bGColor: bGColor,
                        rating: company.averageRating,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
