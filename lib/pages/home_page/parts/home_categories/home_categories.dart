import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/models/category.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_categories/parts/home_categories_list.dart';
import 'package:kerwenli_yol/pages/parts/home_more_button.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/home_categories_shimmer/home_categories_shimmer.dart';
import 'package:kerwenli_yol/providers/api/category.dart';

class HomeCategories extends ConsumerWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            HomeMoreButton(text: 'Kategoriýalar', onTap: () {}),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: HomeCategoriesList(),
            ),
            AppBarBottomLine(thickness: 10),
          ],
        );
      },
      error: (_, _) => const SizedBox.shrink(),
      loading: () => HomeCategoriesShimmer(),
    );
  }
}
