import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/models/product.dart';
import 'package:kerwenli_yol/models/translation.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_new_products/parts/home_new_products_card/parts/home_new_products_card_images.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_card_categories.dart';
import 'package:kerwenli_yol/pages/parts/like_count.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/pages/product_page/product_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors =========
    final bool isLight = isLightTheme(context, ref);
    final Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    // ======== Text Styles =========
    final TextStyle nameStyle = AppTextStyles.medium16;

    final String name = translateText(
      ref,
      product.nameTm,
      product.nameRu,
      product.nameEn,
      product.nameEn,
    );

    final TranslationModel category = product.categoryName;
    final String categoryName = translateText(
      ref,
      category.tm,
      category.ru,
      category.en,
      category.en,
    );

    return GestureDetector(
      onTap: () => goToPage(
        context,
        ProductPage(productId: product.id),
        AxisDirection.left,
        name: 'product_detail',
      ),
      child: Container(
        padding: EdgeInsets.only(left: 9, top: 18, right: 9, bottom: 9),
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
                  HomeNewProductsCardImages(
                    product: product,
                    width: 157,
                    height: 157,
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
                    name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: nameStyle,
                  ),
                  SizedBox(height: 5),
                  HomeVipCompanyCardCategories(
                    iconSize: 10,
                    category: categoryName,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ViewCount(fontSize: 12, viewCount: product.viewCount),
                LikeCount(fontSize: 12, likeCount: product.likesCount),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
