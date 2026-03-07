import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/helpers/methods/image_and_video.dart';
import 'package:kerwenli_yol/models/sponsor.dart';
import 'package:kerwenli_yol/models/translation.dart';
import 'package:kerwenli_yol/pages/company_page/company_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class HomePartnerCard extends ConsumerWidget {
  const HomePartnerCard({
    super.key,
    this.isFirst,
    this.isLast,
    this.forListView,
    this.width,
    required this.sponsor,
  });

  final bool? isFirst, isLast, forListView;
  final SponsorModel sponsor;
  final double? width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    EdgeInsetsGeometry? margin;
    Color? color;
    double imageSize = 43;

    // ========= Colors =======
    bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    // ========= Text Styles =======
    TextStyle textStyle = AppTextStyles.semiBold10;

    final bool forLv = forListView != null && forListView!;
    final bool hasBeginAndEndMarrgin = isFirst != null && isLast != null;
    if (hasBeginAndEndMarrgin) {
      margin = EdgeInsets.only(
        left: isFirst! ? 16 : 0,
        right: isLast! ? 16 : 0,
      );
    } else if (forLv) {
      margin = EdgeInsets.symmetric(vertical: 5);
      color = bgColor;
      imageSize = 91.19775390625;
      textStyle = AppTextStyles.semiBold16;
    }

    final TranslationModel bN = sponsor.businessNames;
    final String name = translateText(ref, bN.tm, bN.ru, bN.en);

    return GestureDetector(
      onTap: () => goToPage(
        context,
        CompanyPage(companyId: sponsor.companyId),
        AxisDirection.left,
      ),
      child: Container(
        width: width,
        margin: margin,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Row(
          children: [
            SizedBox(
              width: imageSize,
              height: imageSize,
              child: showImageMethod(sponsor.companyLogoImg, 0, null),
            ),
            SizedBox(width: 5),
            Expanded(
              child: Text(
                name,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
