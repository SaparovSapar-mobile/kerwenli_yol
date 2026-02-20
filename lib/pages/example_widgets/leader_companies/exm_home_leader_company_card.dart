import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/company_page/company_page.dart';
import 'package:kerwenli_yol/pages/parts/show_image.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class ExmHomeLeaderCompanyCard extends ConsumerWidget {
  const ExmHomeLeaderCompanyCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========= Colors ==========
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    // ========= Text Styles ==========
    final TextStyle textStyle = AppTextStyles.medium10;

    return GestureDetector(
      onTap: () =>
          goToPage(context, CompanyPage(companyId: ''), AxisDirection.left),
      child: SizedBox(
        width: 90,
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
                child: ShowImage(image: 'assets/examples/leader_company.png'),
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Taze Ay',
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
