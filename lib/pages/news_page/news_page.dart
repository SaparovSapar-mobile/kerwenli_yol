import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/header_companies.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAppBar(context),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HeaderCompanies(text: 'Tazelikler'),
          // CategoriesHeader(
          //   categories: headerCategories,
          //   childWidget: Consumer(
          //     builder: (context, ref, _) {
          //       bool isGridCompanies = ref.watch(isGridCompaniesProvider);
          //       if (isGridCompanies) {
          //         return CompaniesGridView();
          //       }
          //       return CompaniesListView();
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
