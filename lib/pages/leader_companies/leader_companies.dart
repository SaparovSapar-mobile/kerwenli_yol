import 'package:flutter/material.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/header_companies.dart';
import 'package:kerwenli_yol/pages/leader_companies/parts/leader_companies_grid_view.dart';
import 'package:kerwenli_yol/pages/parts/categories_header/categories_header.dart';

class LeaderCompaniesPage extends StatelessWidget {
  const LeaderCompaniesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAppBar(context),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HeaderCompanies(text: 'Öňde baryjy kärhanalar'),
          CategoriesHeader(
            categories: headerCategories,
            childWidget: LeaderCompaniesGridView(),
          ),
        ],
      ),
    );
  }
}
