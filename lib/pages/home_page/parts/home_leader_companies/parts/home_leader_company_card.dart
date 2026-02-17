import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/helpers/methods/image_and_video.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/company_page/company_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class HomeLeaderCompanyCard extends ConsumerWidget {
  const HomeLeaderCompanyCard({
    super.key,
    this.isFirst,
    this.isLast,
    required this.company,
  });

  final bool? isFirst, isLast;
  final CompanyModel company;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========= Colors ==========
    final bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;

    // ========= Text Styles ==========
    TextStyle textStyle = AppTextStyles.medium10;

    final String name = translateText(
      ref,
      company.nameTm,
      company.nameRu,
      company.nameEn,
    );

    return GestureDetector(
      onTap: () => goToPage(context, CompanyPage(), AxisDirection.left),
      child: Container(
        width: 90,
        margin: isFirst != null && isLast != null
            ? EdgeInsets.only(left: isFirst! ? 16 : 0, right: isLast! ? 16 : 0)
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 13),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: SizedBox(
                height: 29,
                width: 38,
                child: showImageMethod(company.photo, 0, null),
              ),
            ),
            SizedBox(height: 2),
            Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
