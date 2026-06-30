import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/enums/card_top_text_type.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/pages/example_widgets/companies_page/parts/company_card/parts/exm_company_card_image.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/company_status.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_card_categories.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_rating.dart';
import 'package:kerwenli_yol/pages/parts/card_bookmark_button.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class ExmCompanyListCard extends ConsumerWidget {
  const ExmCompanyListCard({super.key, this.forBookMark});

  final bool? forBookMark;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //======== Colors ======
    final bool isLight = isLightTheme(context, ref);
    Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    Color bookmarkIconColor = isLight
        ? LightColors.primary
        : DarkColors.primary;

    // ====== Text Styles =======
    TextStyle nameStyle = AppTextStyles.medium16;

    bool forBookmark = forBookMark != null && forBookMark!;

    return Container(
      height: companyListCardHeight,
      padding: EdgeInsets.only(left: 9, top: 18, right: 9, bottom: 9),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          ExmCompanyCardImage(
            cardTopTypes: [CardTopTextType.vip],
            height: 100,
            width: 100,
            bookmarkButtonWith: 20,
            bookmarkButtonHeight: 20,
            bookmarkButtonIconSize: 12,
            bookmarkButtonBorderRadius: 4.3,
            forBookMark: forBookmark,
          ),
          SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Türkmenistanda öndürilen şokaladlary alyn',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: nameStyle,
                      ),
                    ),
                    SizedBox(width: 5),
                    if (forBookmark)
                      CardBookmarkButton(
                        companyId: '',
                        bGColor: bookmarkIconColor.withValues(alpha: .2),
                        icnColor: bookmarkIconColor,
                        iconSize: 16,
                      )
                    else
                      const SizedBox.shrink(),
                  ],
                ),
                CompanyStatus(isOpen: false, fontSize: 9),
                SizedBox(height: 2),
                HomeVipCompanyCardCategories(
                  iconSize: 10,
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ViewCount(fontSize: 12, viewCount: forBookma,),
                    HomeVipCompanyRating(fontSize: 12),
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
