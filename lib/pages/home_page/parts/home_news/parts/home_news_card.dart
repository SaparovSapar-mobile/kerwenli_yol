import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/enums/card_top_text_type.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/company_card/parts/company_card_image.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_card_categories.dart';
import 'package:kerwenli_yol/pages/parts/show_date.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class HomeNewsCard extends ConsumerWidget {
  const HomeNewsCard({super.key, this.isFirst, this.isLast, this.width});

  final bool? isFirst, isLast;
  final double? width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // =========== Colors ===========
    bool isLight = isLightTheme(context, ref);
    Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    Color descColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;

    // =========== Text Styles ===========
    TextStyle titleStyle = AppTextStyles.medium10;
    TextStyle descStyle = AppTextStyles.regular10.copyWith(
      fontSize: 8,
      color: descColor,
    );

    return Container(
      width: width,
      height: newsListCardHeight,
      margin: isFirst != null && isLast != null
          ? EdgeInsets.only(left: isFirst! ? 16 : 0, right: isLast! ? 16 : 0)
          : null,
      padding: EdgeInsets.only(left: 5, top: 13, bottom: 5, right: 5),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CompanyCardImage(
            cardTopTypes: [CardTopTextType.news],
            height: double.maxFinite,
            width: 87,
            forBookMark: true,
            cttSize: 6,
            cttTopPosition: -8,
            cardRad: 7,
          ),
          SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Türkmenistanda öndürilen şokaladly süýji',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: titleStyle,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: HomeVipCompanyCardCategories(
                    iconSize: 7,
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                ),
                Text(
                  'Türkmenistanyn Ministrler Kabinetinin yanyndaky Ulag we kommunikasiya',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: descStyle,
                ),
                SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ViewCount(fontSize: 8), ShowDate()],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
