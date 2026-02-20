import 'package:flutter/material.dart';
import 'package:kerwenli_yol/models/new_product.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_new_products/parts/home_new_products_card/home_new_products_card.dart';

class HomeNewProductsList extends StatelessWidget {
  const HomeNewProductsList({super.key, required this.products});

  final List<NewProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 202,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => HomeNewProductsCard(
          isFirst: index == 0,
          isLast: index == products.length - 1,
          product: products[index],
        ),
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: products.length,
      ),
    );
  }
}
