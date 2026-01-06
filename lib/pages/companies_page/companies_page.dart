import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/pages/categories_page/parts/categories_list.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/header_companies.dart';

class CompaniesPage extends StatelessWidget {
  const CompaniesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAppBar(context),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [HeaderCompanies(), CategoriesList()],
      ),
    );
  }
}
