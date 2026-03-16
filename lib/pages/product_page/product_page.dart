import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/models/product.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_top.dart';
import 'package:kerwenli_yol/pages/parts/internet_status_bar/internet_status_bar.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/product_page_shimmer.dart';
import 'package:kerwenli_yol/pages/product_page/parts/product_page_body.dart';
import 'package:kerwenli_yol/providers/api/product.dart';

class ProductPage extends ConsumerWidget {
  const ProductPage({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ProductModel> resultApi = ref.watch(
      fetchProductProvider(productId),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: homePageAppBar(context),
      body: resultApi.when(
        data: (data) {
          if (data.id == '') {
            return Center(child: Text('No Data'));
          }

          return Column(
            children: [
              InternetStatusBar(),
              CompanyPageTop(
                text: 'Haryt ady',
                showBottomLine: false,
                onPressed: () {},
              ),
              ProductPageBody(product: data),
            ],
          );
        },
        error: (_, _) => const SizedBox.shrink(),
        loading: () => ProductPageShimmer(),
      ),
    );
  }
}
