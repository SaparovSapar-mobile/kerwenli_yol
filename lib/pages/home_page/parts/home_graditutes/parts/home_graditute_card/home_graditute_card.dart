import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:html/parser.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/gratitude.dart';
import 'package:kerwenli_yol/pages/gratitude_detail_page/gratitude_detail_page.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_graditutes/parts/home_graditute_card/parts/home_graditute_card_image.dart';
import 'package:kerwenli_yol/pages/parts/show_date.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class HomeGradituteCard extends ConsumerWidget {
  const HomeGradituteCard({
    super.key,
    this.isFirst,
    this.isLast,
    required this.gratitude,
  });

  final bool? isFirst, isLast;
  final GratitudeModel gratitude;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // =========== Colors ===========
    final bool isLight = isLightTheme(context, ref);
    final Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color textColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;

    // =========== Text Styles ===========
    final TextStyle nameStyle = AppTextStyles.semiBold10;
    final TextStyle descStyle = AppTextStyles.regular10.copyWith(
      color: textColor,
    );

    final String name = translateText(
      ref,
      gratitude.nameTm,
      gratitude.nameRu,
      gratitude.nameEn,
    );

    final String description = translateText(
      ref,
      gratitude.descriptionTm,
      gratitude.descriptionRu,
      gratitude.descriptionEn,
    );

    return GestureDetector(
      onTap: () => goToPage(
        context,
        GratitudeDetailPage(gratitudeId: gratitude.id),
        AxisDirection.left,
      ),
      child: Container(
        width: homeGratutitudeWidth,
        margin: isFirst != null && isLast != null
            ? EdgeInsets.only(left: isFirst! ? 16 : 0, right: isLast! ? 16 : 0)
            : null,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                HomeGradituteCardImage(image: gratitude.coverImg),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: nameStyle,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 5),
                child: Text(
                  parse(description).body!.text,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: descStyle,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ViewCount(),
                ShowDate(date: gratitude.createdAt),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
