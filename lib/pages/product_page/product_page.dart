import 'package:flutter/material.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_top.dart';
import 'package:kerwenli_yol/pages/product_page/parts/product_page_body.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.product});

  final ExampleProductCard product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: homePageAppBar(context),
      body: Column(
        children: [
          CompanyPageTop(
            text: 'Haryt ady',
            showBottomLine: false,
            onPressed: () {},
          ),
          ProductPageBody(product: product),
        ],
      ),
    );
  }
}
