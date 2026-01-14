import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_new_products/parts/home_new_products_card/parts/home_new_products_card_images.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/company_status.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_card_categories.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_rating.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class ProductListCard extends ConsumerWidget {
  const ProductListCard({super.key, required this.product});

  final ExampleProductCard product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors ======
    bool isLight = isLightTheme(context, ref);
    Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    // ======== Text Styles ======
    TextStyle nameStyle = AppTextStyles.medium10;

    return Container(
      width: 112,
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeNewProductsCardImages(product: product),
          SizedBox(height: 5),
          Text(
            'Türkmenistanda öndürilen şokaladlary alyn',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: nameStyle,
          ),
          CompanyStatus(isOpen: product.isOpen),
          SizedBox(height: 2),
          HomeVipCompanyCardCategories(),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ViewCount(), HomeVipCompanyRating()],
          ),
        ],
      ),
    );
  }
}
