import 'package:flutter/material.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_top.dart';
import 'package:kerwenli_yol/pages/example_widgets/products_page/exn_product_page_body.dart';
import 'package:kerwenli_yol/pages/parts/internet_status_bar/internet_status_bar.dart';

class ExmProductPage extends StatelessWidget {
  const ExmProductPage({super.key, required this.product});

  final ExampleProductCard product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: homePageAppBar(context),
      body: Column(
        children: [
          InternetStatusBar(),
          CompanyPageTop(
            text: 'Haryt ady',
            showBottomLine: false,
            onPressed: () {},
          ),
          ExnProductPageBody(product: product),
        ],
      ),
    );
  }
}
