import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/header_companies.dart';
import 'package:kerwenli_yol/pages/parts/categories_header/categories_header.dart';
import 'package:kerwenli_yol/pages/parts/internet_status_bar/internet_status_bar.dart';
import 'package:kerwenli_yol/pages/parts/sort_and_filter/sort_and_filter.dart';
import 'package:kerwenli_yol/pages/vip_companies_page/parts/vip_companies_grid_view.dart';
import 'package:kerwenli_yol/pages/vip_companies_page/parts/vip_companies_list_view.dart';
import 'package:kerwenli_yol/providers/parts/grid_or_list.dart';

class VipCompaniesPage extends StatelessWidget {
  const VipCompaniesPage({super.key, required this.vipCompanies});

  final List<CompanyModel> vipCompanies;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: homePageAppBar(context),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InternetStatusBar(),
          HeaderCompanies(text: lang.vipCompanies, leftPadding: 0),
          SortAndFilter(
            gridOrListProvider: gridOrListVipCompaniesSortProvider,
            isGridProvider: isGridVipCompaniesProvider,
          ),
          CategoriesHeader(
            categories: headerCategories,
            childWidget: Consumer(
              builder: (context, ref, _) {
                final bool isGridCompanies = ref.watch(
                  isGridVipCompaniesProvider,
                );
                if (isGridCompanies) {
                  return VipCompaniesGridView(vipCompanies: vipCompanies);
                }
                return VipCompaniesListView(vipCompanies: vipCompanies);
              },
            ),
          ),
        ],
      ),
    );
  }
}
