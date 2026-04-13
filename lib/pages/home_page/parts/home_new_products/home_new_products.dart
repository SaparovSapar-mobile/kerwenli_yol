import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/new_product.dart';
import 'package:kerwenli_yol/models/product.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_new_products/parts/home_new_products_list.dart';
import 'package:kerwenli_yol/pages/new_products_page/new_products_page.dart';
import 'package:kerwenli_yol/pages/parts/home_more_button.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/home_vip_companies_shimmer/home_vip_companies_shimmer.dart';
import 'package:kerwenli_yol/providers/api/product.dart';

class HomeNewProducts extends ConsumerWidget {
  const HomeNewProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    final AsyncValue<List<NewProductModel>> resultApi = ref.watch(
      fetchNewProductsProvider,
    );

    return resultApi.when(
      data: (data) {
        if (data.isEmpty) {
          return const SizedBox.shrink();
        }

        List<ProductModel> products = [];
        for (NewProductModel element in data) {
          products.addAll(element.products);
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HomeMoreButton(
              text: lang.newProducts,
              onTap: () => goToPage(
                context,
                NewProductsPage(products: products),
                AxisDirection.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: HomeNewProductsList(products: products),
            ),
            AppBarBottomLine(thickness: 10),
          ],
        );
      },
      error: (_, _) => const SizedBox.shrink(),
      loading: () => HomeVipCompaniesShimmer(),
    );
  }
}
