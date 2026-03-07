import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:html/parser.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/helpers/methods/image_and_video.dart';
import 'package:kerwenli_yol/models/gratitude.dart';
import 'package:kerwenli_yol/pages/gratitude_detail_page/gratitude_detail_page.dart';
import 'package:kerwenli_yol/pages/parts/show_date.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class GradituteCard extends ConsumerWidget {
  const GradituteCard({super.key, required this.gratitude});

  final GratitudeModel gratitude;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // =========== Colors ===========
    final bool isLight = isLightTheme(context, ref);
    final Color borderColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;
    final Color textColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;
    final Color bgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    // =========== Text Styles ===========
    final TextStyle nameStyle = AppTextStyles.semiBold14;
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
        height: 133,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 11),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 103,
              height: 103,
              decoration: BoxDecoration(
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(6.81),
              ),
              child: showImageMethod(gratitude.coverImg, 6.81, null),
            ),
            SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: nameStyle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(width: 5),
                        Text(
                          parse(description).body!.text,
                          style: descStyle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
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
          ],
        ),
      ),
    );
  }
}
