import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/helpers/methods/image_and_video.dart';
import 'package:kerwenli_yol/models/category.dart';
import 'package:kerwenli_yol/pages/companies_page/companies_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class HomeCategoryCard extends ConsumerWidget {
  const HomeCategoryCard({
    super.key,
    this.isFirst,
    this.isLast,
    required this.category,
  });

  final bool? isFirst, isLast;
  final CategoryModel category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // =========== Colors ===============
    final bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    Color inBgColor = isLight ? LightColors.bgBlogLight : DarkColors.bgBlogDark;

    // =========== Text Styles ===============
    TextStyle textStyle = AppTextStyles.medium12;

    final String name = translateText(
      ref,
      category.nameTm,
      category.nameRu,
      category.nameEn,
    );

    final String image = translateText(
      ref,
      category.imageTm,
      category.imageRu,
      category.imageEn,
    );

    return GestureDetector(
      onTap: () => goToPage(context, CompaniesPage(), AxisDirection.left),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 9),
        margin: isFirst != null && isLast != null
            ? EdgeInsets.only(left: isFirst! ? 16 : 0, right: isLast! ? 16 : 0)
            : null,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Container(
              height: 31,
              width: 31,
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: inBgColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: showImageMethod(image, 5, null),
            ),
            SizedBox(width: 5),
            Text(
              formatTwoLines10(name),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
