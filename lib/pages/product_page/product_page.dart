import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_top.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: homePageAppBar(context),
      body: Column(
        children: [
          CompanyPageTop(
            text: 'Haryt ady Haryt ady Haryt ady Haryt ady Haryt ady',
          ),
        ],
      ),
    );
  }
}
