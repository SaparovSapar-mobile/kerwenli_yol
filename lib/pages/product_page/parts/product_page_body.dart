import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_new_products/parts/home_new_products_card/parts/home_new_products_card_images.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_card_categories.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class ProductPageBody extends ConsumerWidget {
  const ProductPageBody({super.key, required this.product});

  final ExampleProductCard product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========= Colors =======
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    Color innerBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    // ======= Text Styles =======
    TextStyle nameStyle = AppTextStyles.medium16;

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        color: bgColor,
        child: Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: innerBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView(
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
              Text(
                'Türkmenistanda öndürilen şokaladly süýji we lomay harytlar',
                style: nameStyle,
              ),
              SizedBox(height: 10),
              HomeVipCompanyCardCategories(
                iconSize: 10,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
