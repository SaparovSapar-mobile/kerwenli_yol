import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/models/translation.dart';
import 'package:kerwenli_yol/models/working_time.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/parts/company_info/parts/company_info_brands_list.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/parts/company_info/parts/company_info_key_value.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/parts/company_info/parts/company_info_sertificates_list.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/parts/company_info/parts/work_hour.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class CompanyInfo extends ConsumerWidget {
  const CompanyInfo({super.key, required this.company});

  final CompanyDetailModel company;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors ==========
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color innerBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    // ======== Text Styles ==========
    final TextStyle textStyle = AppTextStyles.semiBold12;

    // ======= company name =======
    final TranslationModel compName = company.businessName;
    final String name = translateText(
      ref,
      compName.tm,
      compName.ru,
      compName.en,
    );

    // ======== Working Times =======
    final List<WorkingTimeModel> workingTimes = company.workingTimes;
    final bool hasWorkingTimes = workingTimes.isNotEmpty;

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
            CompanyInfoKeyValue(keyText: 'Kärhananyň ady', valueText: name),
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
            if (hasWorkingTimes)
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text('Iş wagtymyz', style: textStyle),
                  SizedBox(height: 15),
                  ...workingTimes.map((e) {
                    final TranslationModel day = e.day;
                    final String dayTr = translateText(
                      ref,
                      day.tm,
                      day.ru,
                      day.en,
                    );

                    return WorkHour(
                      keyText: dayTr,
                      valueText: '${e.open}-${e.close}',
                    );
                  }),
                ],
              ),
            SizedBox(height: 20),
            Text('Brendlerimiz', style: textStyle),
            SizedBox(height: 15),
            CompanyInfoBrandsList(),
            SizedBox(height: 20),
            Text('Sylaglarymyz', style: textStyle),
            SizedBox(height: 15),
            CompanyInfoSertificatesList(),
          ],
        ),
      ),
    );
  }
}
