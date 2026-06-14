import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/pages/bottom_sheets.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/parts/company_info/parts/company_info_key_value.dart';
import 'package:kerwenli_yol/pages/example_widgets/products_page/exm_home_new_products_card_images.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_card_categories.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_rating.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class ExnProductPageBody extends ConsumerWidget {
  const ExnProductPageBody({super.key, required this.product});

  final ExampleProductCard product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    // ========= Colors =======
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color innerBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    // ======= Text Styles =======
    final TextStyle nameStyle = AppTextStyles.medium16;
    final TextStyle descTitleStyle = AppTextStyles.semiBold12;
    final TextStyle descStyle = AppTextStyles.regular12;

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        color: bgColor,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: innerBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ExmHomeNewProductsCardImages(
                    product: product,
                    width: double.maxFinite,
                    height: 330,
                    cttHeight: 58,
                    cttFontSize: 12,
                    cttTopPosition: -16,
                    bbWith: 34,
                    bbHeight: 34,
                    bbIconSize: 20,
                    bbBorderRadius: 7,
                    dotsSize: 5.36,
                    dotsActiveWidth: 13.41,
                    dotsActiveHeight: 5.36,
                    bbRightPosition: 10,
                    bbTopPosition: 10,
                    forProductPage: true,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Türkmenistanda öndürilen şokaladly süýji we lomay harytlar',
                    style: nameStyle,
                  ),
                  SizedBox(height: 10),
                  HomeVipCompanyCardCategories(
                    iconSize: 10,
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  SizedBox(height: 10),
                  CompanyInfoKeyValue(
                    keyText: lang.fCAPrice,
                    valueText: 'ylalaşykly',
                  ),
                  CompanyInfoKeyValue(
                    keyText: lang.minimumOrderQuantity,
                    valueText: '1 600 sany',
                  ),
                  CompanyInfoKeyValue(
                    keyText: lang.monthlyProductionCapacity,
                    valueText: '10 000 kg',
                  ),
                  CompanyInfoKeyValue(
                    keyText: lang.deliveryTerms,
                    valueText: 'FCA, FOB, CIP, CIF',
                  ),
                  CompanyInfoKeyValue(
                    keyText: lang.paymentCurrency,
                    valueText: 'TMT, USD, EURO',
                  ),
                  CompanyInfoKeyValue(
                    keyText: lang.paymentTerms,
                    valueText: 'S.W.I.F.T',
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ViewCount(fontSize: 13, viewCount: ,),
                      HomeVipCompanyRating(fontSize: 13),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: innerBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(lang.description, style: descTitleStyle),
                  SizedBox(height: 5),
                  Text(
                    '''Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at HampdenContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden...''',
                    style: descStyle,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: innerBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(lang.additionalInformation, style: descTitleStyle),
                  SizedBox(height: 5),
                  CompanyInfoKeyValue(
                    keyText: '${lang.type}:',
                    valueText: 'Şetdaly çaga püresi Ýeserje 90gr',
                  ),
                  CompanyInfoKeyValue(
                    keyText: '${lang.packaging}:',
                    valueText: 'Polietilen',
                  ),
                  CompanyInfoKeyValue(
                    keyText: '${lang.shelfLife}:',
                    valueText: '12 aý',
                  ),
                  CompanyInfoKeyValue(
                    keyText: '${lang.volume}:',
                    valueText: 'Gutyda 16 sany',
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Töleg şertleri: 100% göterimi öňünden bank ulgamynyň üsti bilen tölemek şertinde.',
                    style: descStyle.copyWith(fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 10),
                  PrimaryButton(
                    text: lang.sendRequest,
                    onPressed: () => showMessageBottomSheet(
                      context,
                      lang.sendRequest,
                      'messages.png',
                      '',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
