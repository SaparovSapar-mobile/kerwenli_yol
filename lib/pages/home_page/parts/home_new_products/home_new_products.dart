import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/models/new_product.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_new_products/parts/home_new_products_list.dart';
import 'package:kerwenli_yol/pages/parts/home_more_button.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/home_vip_companies_shimmer/home_vip_companies_shimmer.dart';
import 'package:kerwenli_yol/providers/api/product.dart';

class HomeNewProducts extends ConsumerWidget {
  const HomeNewProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<NewProductModel>> resultApi = ref.watch(
      fetchNewProductsProvider,
    );

    return resultApi.when(
      data: (data) {
        if (data.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HomeMoreButton(text: 'Täze önümler', onTap: () {}),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: HomeNewProductsList(products: data),
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
