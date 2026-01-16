import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/companies_grid_view.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/companies_list_view.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/header_companies.dart';
import 'package:kerwenli_yol/pages/parts/categories_header/categories_header.dart';
import 'package:kerwenli_yol/pages/parts/sort_and_filter/sort_and_filter.dart';
import 'package:kerwenli_yol/providers/parts/grid_or_list.dart';

class CompaniesPage extends StatelessWidget {
  const CompaniesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAppBar(context),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HeaderCompanies(text: 'VIP Karhanalar'),
          SortAndFilter(),
          CategoriesHeader(
            categories: headerCategories,
            childWidget: Consumer(
              builder: (context, ref, _) {
                bool isGridCompanies = ref.watch(isGridCompaniesProvider);
                if (isGridCompanies) {
                  return CompaniesGridView();
                }
                return CompaniesListView();
              },
            ),
          ),
        ],
      ),
    );
  }
}
