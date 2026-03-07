import 'package:flutter/material.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/header_companies.dart';
import 'package:kerwenli_yol/pages/leader_companies/parts/leader_companies_grid_view.dart';
import 'package:kerwenli_yol/pages/parts/categories_header/categories_header.dart';
import 'package:kerwenli_yol/pages/parts/internet_status_bar/internet_status_bar.dart';

class LeaderCompaniesPage extends StatelessWidget {
  const LeaderCompaniesPage({super.key, required this.companies});

  final List<CompanyModel> companies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAppBar(context),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InternetStatusBar(),
          HeaderCompanies(text: 'Öňde baryjy kärhanalar', leftPadding: 0),
          CategoriesHeader(
            categories: headerCategories,
            childWidget: LeaderCompaniesGridView(companies: companies),
          ),
        ],
      ),
    );
  }
}
