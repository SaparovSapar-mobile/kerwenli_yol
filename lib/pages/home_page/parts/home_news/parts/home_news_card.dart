import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:html/parser.dart';
import 'package:kerwenli_yol/enums/card_top_text_type.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/news_model.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/company_card/parts/company_card_image.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_card_categories.dart';
import 'package:kerwenli_yol/pages/news_detail_page/news_detail_page.dart';
import 'package:kerwenli_yol/pages/parts/show_date.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class HomeNewsCard extends ConsumerWidget {
  const HomeNewsCard({
    super.key,
    this.isFirst,
    this.isLast,
    this.width,
    required this.news,
  });

  final bool? isFirst, isLast;
  final double? width;
  final NewsModel news;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // =========== Colors ===========
    final bool isLight = isLightTheme(context, ref);
    final Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color descColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;

    // =========== Text Styles ===========
    final TextStyle titleStyle = AppTextStyles.medium10;
    final TextStyle descStyle = AppTextStyles.regular10.copyWith(
      fontSize: 8,
      color: descColor,
    );

    final String name = translateText(
      ref,
      news.nameTm,
      news.nameRu,
      news.nameEn,
    );
    final String description = translateText(
      ref,
      news.descriptionTm,
      news.descriptionRu,
      news.descriptionEn,
    );

    return GestureDetector(
      onTap: () => goToPage(context, NewsDetailPage(), AxisDirection.left),
      child: Container(
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
              image: news.coverImage,
            ),
            SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
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
                    parse(description).body!.text,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: descStyle,
                  ),
                  SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ViewCount(fontSize: 8, viewCount: news.viewsCount),
                      ShowDate(date: news.updatedAt),
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
