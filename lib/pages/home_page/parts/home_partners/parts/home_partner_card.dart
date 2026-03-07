import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/helpers/methods/image_and_video.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/sponsor.dart';
import 'package:kerwenli_yol/models/translation.dart';
import 'package:kerwenli_yol/pages/company_page/company_page.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class HomePartnerCard extends ConsumerWidget {
  const HomePartnerCard({
    super.key,
    this.isFirst,
    this.isLast,
    required this.sponsor,
  });

  final bool? isFirst, isLast;
  final SponsorModel sponsor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    EdgeInsetsGeometry? margin;

    final TextStyle textStyle = AppTextStyles.semiBold10;

    final bool hasMargin = isFirst != null && isLast != null;
    if (hasMargin) {
      margin = EdgeInsets.only(
        left: isFirst! ? 16 : 0,
        right: isLast! ? 16 : 0,
      );
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
        width: homeSponsorsWidth,
        margin: margin,
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            SizedBox(
              width: 43,
              height: 43,
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
