import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_card.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/company_page_info.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_medias/company_page_medias.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_products_or_services/company_page_products_or_services.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_tabbar.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_top.dart';

class CompanyPage extends StatelessWidget {
  const CompanyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: homePageAppBar(context),
        body: Column(
          children: [
            CompanyPageTop(text: 'VIP Karhanalar', showBottomLine: true),
            CompanyPageTabbar(),
            CompanyPageCard(),
            Expanded(
              child: TabBarView(
                children: [
                  CompanyPageInfo(),
                  CompanyPageProductsOrServices(),
                  CompanyPageMedias(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
