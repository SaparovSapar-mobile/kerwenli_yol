import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/models/opportunity.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/parts/company_features/parts/company_feature_part.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class CompanyFeatures extends ConsumerWidget {
  const CompanyFeatures({super.key, required this.company});

  final CompanyDetailModel company;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========== Colors =============
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color innerBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    // ========== Text Styles =============
    final TextStyle textStyle = AppTextStyles.semiBold12;

    final List<OpportunityTrModel> opportunities = company.opportunity.labels;
    final bool hasOpp = opportunities.isNotEmpty;

    return Container(
      padding: EdgeInsets.all(10),
      color: bgColor,
      child: Container(
        padding: EdgeInsetsGeometry.all(8),
        decoration: BoxDecoration(
          color: innerBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Amatlyklary', style: textStyle),
            SizedBox(height: 4),
            if (hasOpp)
              ...opportunities.map((e) {
                final String name = translateText(
                  ref,
                  e.labelTm,
                  e.labelRu,
                  e.labelEn,
                );

                return CompanyFeaturePart(text: name, image: 'router.png');
              }),
          ],
        ),
      ),
    );
  }
}
