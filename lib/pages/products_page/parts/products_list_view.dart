import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/models/product.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';
import 'package:kerwenli_yol/pages/parts/product_list_card/product_list_card.dart';
import 'package:kerwenli_yol/pages/parts/some_error.dart';
import 'package:kerwenli_yol/providers/api/product.dart';
import 'package:kerwenli_yol/providers/pages/products_page.dart';
import 'package:kerwenli_yol/services/api/product.dart';

class ProductsListView extends ConsumerWidget {
  const ProductsListView({super.key, required this.companyId});

  final String companyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool hasData = ref.watch(hasCProductsProvider);
    final bool loading = ref.watch(loadCProductsProvider);
    final bool hasErr = ref.watch(hasErrCProductsProvider);

    Widget returnWidget;

    if (!hasData) {
      returnWidget = NoResult();
    } else if (!hasErr) {
      returnWidget = ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
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
              return ProductListCard(product: product);
            },
            error: (error, stackTrace) => const SizedBox.shrink(),
            loading: () {
              if (!loading) {
                Future.delayed(
                  const Duration(),
                  () => ref.read(hasErrCProductsProvider.notifier).state = true,
                );
              }
              return null;
            },
          );
        },
      );
    } else {
      returnWidget = SomeError(
        ref: ref,
        apiProviders: [fetchCompanyProductsProvider],
      );
    }

    return Stack(children: [returnWidget, if (loading) loadWidget]);
  }
}
