import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/example_widgets/products_page/exm_home_new_products_card_images.dart';
import 'package:kerwenli_yol/pages/example_widgets/products_page/exm_product_page.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/company_status.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_card_categories.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_rating.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class ExmHomeNewProductsCard extends ConsumerWidget {
  const ExmHomeNewProductsCard({
    super.key,
    this.isFirst,
    this.isLast,
    required this.product,
  });

  final bool? isFirst, isLast;
  final ExampleProductCard product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors ======
    final bool isLight = isLightTheme(context, ref);
    final Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    // ======== Text Styles ======
    final TextStyle nameStyle = AppTextStyles.medium10;

    return GestureDetector(
      onTap: () => goToPage(
        context,
        ExmProductPage(product: product),
        AxisDirection.left,
      ),
      child: Container(
        width: 112,
        margin: isFirst != null && isLast != null
            ? EdgeInsets.only(left: isFirst! ? 16 : 0, right: isLast! ? 16 : 0)
            : null,
        padding: EdgeInsets.only(left: 6, top: 12, right: 6, bottom: 6),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExmHomeNewProductsCardImages(product: product),
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
              children: [HomeVipCompanyRating()],
            ),
          ],
        ),
      ),
    );
  }
}
