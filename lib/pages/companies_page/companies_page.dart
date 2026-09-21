import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/companies_grid_view.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/companies_list_view.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/header_companies.dart';
import 'package:kerwenli_yol/pages/parts/internet_status_bar/internet_status_bar.dart';
import 'package:kerwenli_yol/pages/parts/sort_and_filter/sort_and_filter.dart';
import 'package:kerwenli_yol/providers/pages/companies_page.dart';
import 'package:kerwenli_yol/providers/parts/grid_or_list.dart';
import 'package:kerwenli_yol/providers/parts/inputs.dart';
import 'package:kerwenli_yol/pages/parts/app_refresh_indicator.dart';
import 'package:kerwenli_yol/providers/api/company.dart';

class CompaniesPage extends ConsumerWidget {
  const CompaniesPage({
    super.key,
    required this.categoryId,
    this.subCategoryId,
  });

  final String categoryId;
  final String? subCategoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    // выбор из фильтра (бэкенд принимает одну подкатегорию за запрос)
    final List<String> selectedSubs = ref.watch(subCategoryFiltersProvider);
    final String? activeSubCategoryId = selectedSubs.length == 1
        ? selectedSubs.first
        : subCategoryId;

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        ref.read(hasErrCompaniesProvider.notifier).state = false;
        ref.read(subCategoryFiltersProvider.notifier).removeAll();
      },
      child: Scaffold(
        appBar: homePageAppBar(context),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InternetStatusBar(),
            HeaderCompanies(text: lang.companies, leftPadding: 0),
            SortAndFilter(
              gridOrListProvider: gridOrListSortProvider,
              isGridProvider: isGridCompaniesProvider,
            ),
            Expanded(
              child: AppRefreshIndicator(
                providers: [
                  fetchCompaniesByCategoryIdProvider,
                  hasCompaniesProvider,
                  hasErrCompaniesProvider,
                  loadCompaniesProvider,
                ],
                child: Consumer(
                  builder: (context, ref, _) {
                    final bool isGridCompanies = ref.watch(
                      isGridCompaniesProvider,
                    );
                    if (isGridCompanies) {
                      return CompaniesGridView(
                        categoryId: categoryId,
                        subCategoryId: activeSubCategoryId,
                      );
                    }
                    return CompaniesListView(
                      categoryId: categoryId,
                      subCategoryId: activeSubCategoryId,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
