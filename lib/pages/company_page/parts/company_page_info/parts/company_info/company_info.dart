import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/parts/company_info/parts/company_info_key_value.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class CompanyInfo extends ConsumerWidget {
  const CompanyInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    Color innerBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    TextStyle textStyle = AppTextStyles.semiBold12;

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
            Text('Karhana maglumaty', style: textStyle),
            SizedBox(height: 15),
            CompanyInfoKeyValue(
              keyText: 'Kärhananyň ady',
              valueText: 'Nesil Kofe hususy kärhanasy',
            ),
            CompanyInfoKeyValue(
              keyText: 'Esaslandyrylan Senesi',
              valueText: '11.11.2025',
            ),
            CompanyInfoKeyValue(
              keyText: 'Hasaba alyjy gurama',
              valueText: 'Türkmenistanyň Ykdysadyýet we Maliýe ministrligi',
            ),
            CompanyInfoKeyValue(
              keyText: 'Hasaba alyş belgisi',
              valueText: '№23988161',
            ),
            CompanyInfoKeyValue(
              keyText: 'Guramaçylyk hukuk görnüşi',
              valueText: 'Hojalyk jemgyyeti',
            ),
            CompanyInfoKeyValue(keyText: 'Iş ugry', valueText: 'Onumcilik'),
            CompanyInfoKeyValue(keyText: 'Eýeçiligi', valueText: 'senagaty'),
            CompanyInfoKeyValue(keyText: 'Esasy önümleri', valueText: 'Bar'),
            CompanyInfoKeyValue(keyText: 'Hukuk salgysy', valueText: 'Bar'),
            CompanyInfoKeyValue(keyText: 'Goşmaça maglumat', valueText: 'Bar'),
            SizedBox(height: 20),
            Text('Iş wagtymyz', style: textStyle),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
