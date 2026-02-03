import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_top.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: homePageAppBar(context),
      body: Column(
        children: [
          CompanyPageTop(
            text: 'Tazelik',
            showBottomLine: true,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
