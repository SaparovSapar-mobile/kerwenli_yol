import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/header_companies.dart';
import 'package:kerwenli_yol/pages/parts/internet_status_bar/internet_status_bar.dart';
import 'package:kerwenli_yol/pages/sponsors_page/parts/sponsors_list_view.dart';

class GratitudesPage extends StatelessWidget {
  const GratitudesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAppBar(context),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InternetStatusBar(),
          HeaderCompanies(text: 'Minnetdarlyklar'),
          Expanded(child: SponsorsListView()),
        ],
      ),
    );
  }
}
