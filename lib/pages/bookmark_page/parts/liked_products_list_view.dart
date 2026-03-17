import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/models/product.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';
import 'package:kerwenli_yol/pages/parts/product_list_card/product_list_card.dart';
import 'package:kerwenli_yol/providers/api/product.dart';
import 'package:kerwenli_yol/providers/pages/products_page.dart';
import 'package:kerwenli_yol/services/api/product.dart';

class LikedProductsListView extends ConsumerWidget {
  const LikedProductsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool hasData = ref.watch(hasFProductsProvider);
    final bool loading = ref.watch(loadFProductsProvider);
    final bool hasErr = ref.watch(hasErrFProductsProvider);

    Widget returnWidget;

    if (!hasData) {
      returnWidget = NoResult(
        ref: ref,
        apiProviders: [fetchLikedProductsProvider],
      );
    } else if (!hasErr) {
      returnWidget = ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final page = index ~/ pageSize + 1;
          final indexInPage = index % pageSize;

          final ProductParams arg = ProductParams(
            page: page,
            pageSize: pageSize,
            companyId: '',
            userId: '',
          );
          final AsyncValue<List<ProductModel>> resultApi = ref.watch(
            fetchLikedProductsProvider(arg),
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
                  () => ref.read(loadFProductsProvider.notifier).state = true,
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
