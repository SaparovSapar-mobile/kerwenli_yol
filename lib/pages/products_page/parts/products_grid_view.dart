import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/models/product.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';
import 'package:kerwenli_yol/pages/parts/product_card/product_card.dart';
import 'package:kerwenli_yol/providers/api/product.dart';
import 'package:kerwenli_yol/providers/pages/products_page.dart';
import 'package:kerwenli_yol/services/api/product.dart';

class ProductsGridView extends ConsumerWidget {
  const ProductsGridView({super.key, required this.companyId});

  final String companyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool hasData = ref.watch(hasCProductsProvider);
    final bool loading = ref.watch(loadCProductsProvider);
    final bool hasErr = ref.watch(hasErrCProductsProvider);

    Widget returnWidget;

    if (!hasData) {
      returnWidget = NoResult(
        ref: ref,
        apiProviders: [fetchCompanyProductsProvider],
      );
    } else if (!hasErr) {
      returnWidget = GridView.builder(
        itemCount: homeProducts.length,
        padding: EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: productCardHeight,
        ),
        itemBuilder: (context, index) {
          final page = index ~/ pageSize + 1;
          final indexInPage = index % pageSize;

          final ProductParams arg = ProductParams(
            page: page,
            pageSize: pageSize,
            companyId: companyId,
            userId: '',
          );
          final AsyncValue<List<ProductModel>> resultApi = ref.watch(
            fetchCompanyProductsProvider(arg),
          );

          return resultApi.when(
            data: (response) {
              if (indexInPage >= response.length) {
                return null;
              }

              final ProductModel product = response[indexInPage];
              return ProductCard(product: product);
            },
            error: (error, stackTrace) => const SizedBox.shrink(),
            loading: () {
              if (!loading) {
                Future.delayed(
                  const Duration(),
                  () => ref.read(loadCProductsProvider.notifier).state = true,
                );
              }
              return null;
            },
          );
        },
      );
    } else {
      returnWidget = Text('has error');
    }

    return Stack(children: [returnWidget, if (loading) loadWidget]);
  }
}
