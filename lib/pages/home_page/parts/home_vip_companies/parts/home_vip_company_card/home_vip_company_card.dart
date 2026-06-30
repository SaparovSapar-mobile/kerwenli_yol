import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/company_page/company_page.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/home_vip_company_card_image.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/company_status.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_card_categories.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_rating.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class HomeVipCompanyCard extends ConsumerWidget {
  const HomeVipCompanyCard({
    super.key,
    this.isFirst,
    this.isLast,
    required this.cardTopTypes,
    required this.company,
  });

  final bool? isFirst, isLast;
  final List<String> cardTopTypes;
  final CompanyModel company;

  // Вычисляем открыто/закрыто по working_time
  

    @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = isLightTheme(context, ref);
    final Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    EdgeInsetsGeometry? margin;
    if (isFirst != null && isLast != null) {
      margin = EdgeInsets.only(
        left: isFirst! ? 16 : 0,
        right: isLast! ? 16 : 0,
      );
    }

    final String name = translateText(
      ref,
      company.nameTm,
      company.nameRu,
      company.nameEn,
      company.nameEn,
    );

    final String? subcategoryName = _getSubcategoryName(ref);
    final bool isOpen = computeIsOpen(company);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => goToPage(
        context,
        CompanyPage(companyId: company.individualUuid),
        AxisDirection.left,
      ),
      child: Container(
        width: vipCompanyCardWidth,
        margin: margin,
        padding: const EdgeInsets.only(left: 6, top: 12, right: 6, bottom: 6),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeVipCompanyCardImage(
              cardTopTypes: cardTopTypes,
              company: company,
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 27,
              child: Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.medium12,
              ),
            ),
            CompanyStatus(isOpen: isOpen), // ✅ динамически
            const SizedBox(height: 2),
            HomeVipCompanyCardCategories(
              category: subcategoryName, // ✅ из данных
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ViewCount(viewCount: company.viewsCount),
                HomeVipCompanyRating(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String? _getSubcategoryName(WidgetRef ref) {
    if (company.subcategoryNames.isEmpty) return null;
    final sub = company.subcategoryNames.first as Map<String, dynamic>;
    return translateText(
      ref,
      sub['name_tm'] ?? '',
      sub['name_ru'] ?? '',
      sub['name_en'] ?? '',
      sub['name_en'] ?? '',
    );
  }
}


bool computeIsOpen(CompanyModel company) {
    final now = DateTime.now();
    final todayName = englishDayName(now.weekday); // e.g. "Monday"

    for (final wt in company.workingTime) {
      final String dayEn = (wt['day']?['en'] ?? '').toString().trim();
      if (dayEn.toLowerCase() == todayName.toLowerCase()) {
        final String open = wt['open'] ?? '';
        final String close = wt['close'] ?? '';
        if (open.isEmpty || close.isEmpty) return false;

        final openTime = parseTime(open);
        final closeTime = parseTime(close);
        final nowMinutes = now.hour * 60 + now.minute;

        return nowMinutes >= openTime && nowMinutes < closeTime;
      }
    }
    return false; // если сегодня выходной или нет данных
  }

  String englishDayName(int weekday) {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return days[weekday - 1];
  }

  int parseTime(String time) {
    // "09:00" → 540
    final parts = time.split(':');
    if (parts.length != 2) return 0;
    return (int.tryParse(parts[0]) ?? 0) * 60 + (int.tryParse(parts[1]) ?? 0);
  }

