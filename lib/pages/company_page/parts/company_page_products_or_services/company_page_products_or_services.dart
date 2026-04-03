import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/models/category.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_part_tabbar.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_products_or_services/company_page_products_sort_button.dart';
import 'package:kerwenli_yol/pages/products_page/parts/products_grid_view.dart';
import 'package:kerwenli_yol/pages/products_page/parts/products_list_view.dart';
import 'package:kerwenli_yol/providers/api/category.dart';
import 'package:kerwenli_yol/providers/parts/grid_or_list.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class CompanyPageProductsOrServices extends ConsumerWidget {
  const CompanyPageProductsOrServices({super.key, required this.companyId});

  final String companyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors ===========
    final bool isLight = isLightTheme(context, ref);
    final Color tabbarViewBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    final AsyncValue<List<CategoryModel>> resultApi = ref.watch(
      fetchCategoriesByCompanyIdProvider(companyId),
    );
    final bool isGrid = ref.watch(isGridProductsProvider);

    return resultApi.when(
      data: (data) {
        final bool noCategories = data.isEmpty;
        if (noCategories) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox.shrink(),
                  CompanyPageProductsSortButton(),
                ],
              ),
              Expanded(
                child: Container(
                  color: tabbarViewBgColor,
                  child: isGrid
                      ? ProductsGridView(companyId: companyId)
                      : ProductsListView(companyId: companyId),
                ),
              ),
            ],
          );
        }

        final List<String> tabTexts = data.map((cat) {
          final String name = translateText(
            ref,
            cat.nameTm,
            cat.nameRu,
            cat.nameEn,
          );

          return name;
        }).toList();

        return DefaultTabController(
          length: data.length,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(child: CompanyPagePartTabbar(tabTexts: tabTexts)),
                  CompanyPageProductsSortButton(),
                ],
              ),
              Expanded(
                child: Container(
                  color: tabbarViewBgColor,
                  child: TabBarView(
                    children: data.map((e) {
                      if (isGrid) {
                        return ProductsGridView(companyId: companyId);
                      }
                      return ProductsListView(companyId: companyId);
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      error: (_, _) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
    );
  }
}
