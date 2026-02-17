import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_new_products/parts/home_new_products_card/parts/home_new_products_card_images.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_card_categories.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_rating.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/pages/product_page/product_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class ProductListCard extends ConsumerWidget {
  const ProductListCard({super.key, required this.product});

  final ExampleProductCard product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors ======
    final bool isLight = isLightTheme(context, ref);
    Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    // ======== Text Styles ======
    TextStyle nameStyle = AppTextStyles.medium16;

    return GestureDetector(
      onTap: () =>
          goToPage(context, ProductPage(product: product), AxisDirection.left),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: productListCardHeight,
        padding: EdgeInsets.only(left: 9, top: 18, right: 9, bottom: 9),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            HomeNewProductsCardImages(
              product: product,
              width: 100,
              height: 100,
              cttHeight: 27,
              cttFontSize: 9,
              cttTopPosition: -10,
            ),
            SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Türkmenistanda öndürilen şokaladlary alyn',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: nameStyle,
                        ),
                        SizedBox(height: 8),
                        HomeVipCompanyCardCategories(
                          iconSize: 9,
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ViewCount(fontSize: 10),
                      HomeVipCompanyRating(fontSize: 10),
                    ],
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
