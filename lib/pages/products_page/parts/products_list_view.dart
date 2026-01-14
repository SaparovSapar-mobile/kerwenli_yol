import 'package:flutter/material.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/pages/parts/product_list_card/product_list_card.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) =>
          ProductListCard(product: homeProducts[index]),
      itemCount: homeProducts.length,
    );
  }
}
