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

class LeaderCompanyCard extends ConsumerWidget {
  const LeaderCompanyCard({super.key, required this.company});

  final CompanyModel company;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========= Colors =========
    final bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;

    // ========= Text Styles =========
    TextStyle textStyle = AppTextStyles.semiBold10;

    String name = translateText(
      ref,
      company.nameTm,
      company.nameRu,
      company.nameEn,
    );

    return GestureDetector(
      onTap: () => goToPage(context, CompanyPage(), AxisDirection.left),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 17),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: SizedBox(
              height: 37,
              width: 50,
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
    );
  }
}
