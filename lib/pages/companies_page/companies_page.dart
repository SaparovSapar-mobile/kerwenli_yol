import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/companies_grid_view.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/companies_list_view.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/header_companies.dart';
import 'package:kerwenli_yol/pages/parts/categories_header/categories_header.dart';
import 'package:kerwenli_yol/pages/parts/internet_status_bar/internet_status_bar.dart';
import 'package:kerwenli_yol/pages/parts/sort_and_filter/sort_and_filter.dart';
import 'package:kerwenli_yol/providers/pages/companies_page.dart';
import 'package:kerwenli_yol/providers/parts/grid_or_list.dart';

class CompaniesPage extends ConsumerWidget {
  const CompaniesPage({super.key, required this.categoryId});

  final String categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 9f4806b2-2fc8-4de1-8c32-63b5f24f57b2
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        ref.read(hasErrCompaniesProvider.notifier).state = false;
      },
      child: Scaffold(
        appBar: homePageAppBar(context),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InternetStatusBar(),
            HeaderCompanies(text: 'Karhanalar'),
            SortAndFilter(
              gridOrListProvider: gridOrListSortProvider,
              isGridProvider: isGridCompaniesProvider,
            ),
            CategoriesHeader(
              categories: headerCategories,
              childWidget: Consumer(
                builder: (context, ref, _) {
                  final bool isGridCompanies = ref.watch(
                    isGridCompaniesProvider,
                  );
                  if (isGridCompanies) {
                    return CompaniesGridView(categoryId: categoryId);
                  }
                  return CompaniesListView(categoryId: categoryId);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
