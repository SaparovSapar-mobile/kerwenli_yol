import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
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
    final AppLocalizations lang = AppLocalizations.of(context)!;

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
    final TranslationModel catName = company.categoryName;
    final String name = translateText(
      ref,
      compName.tm,
      compName.ru,
      compName.en,
      compName.en,
    );
    final String categoryName = translateText(
      ref,
      catName.tm,
      catName.ru,
      catName.en,
      catName.en,
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
            Text(lang.companyInformation, style: textStyle),
            SizedBox(height: 15),
            CompanyInfoKeyValue(keyText: lang.companyName, valueText: name),
            CompanyInfoKeyValue(
              keyText: lang.dateEstablishment,
              valueText: '11.11.2025',
            ),
            CompanyInfoKeyValue(
              keyText: lang.registrationAuthority,
              valueText: 'Türkmenistanyň Ykdysadyýet we Maliýe ministrligi',
            ),
            CompanyInfoKeyValue(
              keyText: lang.registrationNumber,
              valueText: '№23988161',
            ),
            CompanyInfoKeyValue(
              keyText: lang.legalForm,
              valueText: 'Hojalyk jemgyyeti',
            ),
            CompanyInfoKeyValue(
              keyText: lang.businessActivity,
              valueText: categoryName,
            ),
            CompanyInfoKeyValue(
              keyText: lang.ownershipType,
              valueText: 'senagaty',
            ),
            CompanyInfoKeyValue(keyText: lang.mainProducts, valueText: 'Bar'),
            CompanyInfoKeyValue(keyText: lang.legalAddress, valueText: 'Bar'),
            CompanyInfoKeyValue(
              keyText: lang.additionalInformation,
              valueText: 'Bar',
            ),
            if (hasWorkingTimes)
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(lang.workingHours, style: textStyle),
                  SizedBox(height: 15),
                  ...workingTimes.map((e) {
                    final TranslationModel day = e.day;
                    final String dayTr = translateText(
                      ref,
                      day.tm,
                      day.ru,
                      day.en,
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
            Text(lang.ourBrands, style: textStyle),
            SizedBox(height: 15),
            CompanyInfoBrandsList(),
            SizedBox(height: 20),
            Text(lang.ourAwards, style: textStyle),
            SizedBox(height: 15),
            CompanyInfoSertificatesList(),
          ],
        ),
      ),
    );
  }
}
