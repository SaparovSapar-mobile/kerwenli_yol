import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/companies_grid_view.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/header_companies.dart';
import 'package:kerwenli_yol/pages/parts/sort_and_filter/sort_and_filter.dart';

class CompaniesPage extends StatelessWidget {
  const CompaniesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAppBar(context),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HeaderCompanies(),
          SortAndFilter(),
          SizedBox(height: 8),
          CompaniesGridView(),
        ],
      ),
    );
  }
}
