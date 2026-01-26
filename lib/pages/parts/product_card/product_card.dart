import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_new_products/parts/home_new_products_card/parts/home_new_products_card_images.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_card_categories.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_rating.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/pages/product_page/product_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({super.key, required this.product});

  final ExampleProductCard product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors =========
    bool isLight = isLightTheme(context, ref);
    Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    // ======== Text Styles =========
    TextStyle nameStyle = AppTextStyles.medium16;

    return GestureDetector(
      onTap: () => goToPage(context, ProductPage(), AxisDirection.left),
      child: Container(
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CompanyCardImage(cardTopTypes: [CardTopTextType.vip]),
                  HomeNewProductsCardImages(
                    product: product,
                    width: 157,
                    height: 174,
                    cttHeight: 27,
                    cttFontSize: 9,
                    cttTopPosition: -10,
                    bbWith: 32,
                    bbHeight: 32,
                    bbIconSize: 18,
                    bbBorderRadius: 7,
                    dotsSize: 5.36,
                    dotsActiveWidth: 13.41,
                    dotsActiveHeight: 5.36,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Türkmenistanda öndürilen şokaladlary alyn',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: nameStyle,
                  ),
                  SizedBox(height: 5),
                  HomeVipCompanyCardCategories(iconSize: 10),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ViewCount(fontSize: 12),
                HomeVipCompanyRating(fontSize: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
