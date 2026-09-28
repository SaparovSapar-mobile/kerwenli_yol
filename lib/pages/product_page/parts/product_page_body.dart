import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/helpers/methods/pages/bottom_sheets.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/product.dart';
import 'package:kerwenli_yol/models/translation.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/parts/company_info/parts/company_info_key_value.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_new_products/parts/home_new_products_card/parts/home_new_products_card_images.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_card_categories.dart';
import 'package:kerwenli_yol/pages/parts/like_count.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class ProductPageBody extends ConsumerWidget {
  const ProductPageBody({super.key, required this.product});

  final ProductModel product;

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

    /// Характеристики приходят как {tm, ru, en}. Пустая строка означает,
    /// что компания поле не заполнила - такую строку не показываем совсем.
    String textOf(TranslationModel m) =>
        translateText(ref, m.tm, m.ru, m.en, m.en).trim();

    // цену раньше брали из json['price'], которого сервер не отдаёт:
    // она всегда была 0, и подставлялось захардкоженное 'ylalasykly'
    String priceText = textOf(product.fcaPrice);
    if (priceText.isEmpty && product.price != 0) {
      priceText = product.price.toString();
    }

    final String minQuantity = textOf(product.minimumOrderQuantity);
    final String capacity = textOf(product.capacityPerMonth);
    final String delivery = textOf(product.orderCondition);
    final String payTerms = textOf(product.paymentTerms);
    // ["TMT", "TMT", "TMT"] уже свёрнуто в модели до ["TMT"]
    final String payCurrency = product.payment.join(', ');

    final String typeText = textOf(product.type);
    final String packagingText = textOf(product.packaging);
    final String shelfLife = textOf(product.expirationDate);
    final String volumeText = textOf(product.volume);
    final bool hasAdditionalInfo = <String>[
      typeText,
      packagingText,
      shelfLife,
      volumeText,
    ].any((String e) => e.isNotEmpty);

    final String description = translateText(
      ref,
      product.descriptionTm,
      product.descriptionRu,
      product.descriptionEn,
      product.descriptionEn,
    );

    final String name = translateText(
      ref,
      product.nameTm,
      product.nameRu,
      product.nameEn,
      product.nameEn,
    );

    final TranslationModel categoryName = product.categoryName;
    final String catName = translateText(
      ref,
      categoryName.tm,
      categoryName.ru,
      categoryName.en,
      categoryName.en,
    );

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
                  HomeNewProductsCardImages(
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
                  Text(name, style: nameStyle),
                  SizedBox(height: 10),
                  HomeVipCompanyCardCategories(
                    iconSize: 10,
                    mainAxisAlignment: MainAxisAlignment.start,
                    category: catName,
                  ),
                  SizedBox(height: 10),
                  if (priceText.isNotEmpty)
                    CompanyInfoKeyValue(
                      keyText: lang.fCAPrice,
                      valueText: priceText,
                    ),
                  if (minQuantity.isNotEmpty)
                    CompanyInfoKeyValue(
                      keyText: lang.minimumOrderQuantity,
                      valueText: minQuantity,
                    ),
                  if (capacity.isNotEmpty)
                    CompanyInfoKeyValue(
                      keyText: lang.monthlyProductionCapacity,
                      valueText: capacity,
                    ),
                  if (delivery.isNotEmpty)
                    CompanyInfoKeyValue(
                      keyText: lang.deliveryTerms,
                      valueText: delivery,
                    ),
                  if (payCurrency.isNotEmpty)
                    CompanyInfoKeyValue(
                      keyText: lang.paymentCurrency,
                      valueText: payCurrency,
                    ),
                  if (payTerms.isNotEmpty)
                    CompanyInfoKeyValue(
                      keyText: lang.paymentTerms,
                      valueText: payTerms,
                    ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ViewCount(fontSize: 13, viewCount: product.viewCount),
                      LikeCount(fontSize: 13, likeCount: product.likesCount),
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
                  Html(
                    data: description,
                    style: {
                      "*": Style(
                        fontWeight: FontWeight.w400,
                        fontSize: FontSize(12),
                        lineHeight: LineHeight.number(1.20),
                        fontFamily: "Rubik",
                      ),
                    },
                  ),
                  // Text(
                  //   '''Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at HampdenContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden...''',
                  //   style: descStyle,
                  // ),
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
                  if (hasAdditionalInfo) ...[
                    Text(lang.additionalInformation, style: descTitleStyle),
                    SizedBox(height: 5),
                    if (typeText.isNotEmpty)
                      CompanyInfoKeyValue(
                        keyText: '${lang.type}:',
                        valueText: typeText,
                      ),
                    if (packagingText.isNotEmpty)
                      CompanyInfoKeyValue(
                        keyText: '${lang.packaging}:',
                        valueText: packagingText,
                      ),
                    if (shelfLife.isNotEmpty)
                      CompanyInfoKeyValue(
                        keyText: '${lang.shelfLife}:',
                        valueText: shelfLife,
                      ),
                    if (volumeText.isNotEmpty)
                      CompanyInfoKeyValue(
                        keyText: '${lang.volume}:',
                        valueText: volumeText,
                      ),
                    SizedBox(height: 10),
                  ],
                  PrimaryButton(
                    text: lang.sendRequest,
                    onPressed: () => showMessageBottomSheet(
                      context,
                      lang.sendRequest,
                      'messages.png',
                      product.companyId,
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
