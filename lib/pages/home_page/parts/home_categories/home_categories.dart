import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/category.dart';
import 'package:kerwenli_yol/pages/categories_page/categories_page.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_categories/parts/home_categories_list.dart';
import 'package:kerwenli_yol/pages/parts/fetch_error_retry.dart';
import 'package:kerwenli_yol/pages/parts/home_more_button.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/home_categories_shimmer/home_categories_shimmer.dart';
import 'package:kerwenli_yol/providers/api/category.dart';

class HomeCategories extends ConsumerWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    final AsyncValue<List<CategoryModel>> resultApi = ref.watch(
      fetchCategoriesProvider,
    );

    return resultApi.when(
      data: (data) {
        if (data.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HomeMoreButton(
              text: lang.categories,
              onTap: () =>
                  goToPage(context, CategoriesPage(), AxisDirection.left),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: HomeCategoriesList(categories: data),
            ),
            AppBarBottomLine(thickness: 10),
          ],
        );
      },
      error: (_, _) => FetchErrorRetry(
        onRetry: () => ref.invalidate(fetchCategoriesProvider),
      ),
      loading: () => HomeCategoriesShimmer(),
    );
  }
}
