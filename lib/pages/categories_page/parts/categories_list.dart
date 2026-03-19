import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/models/category.dart';
import 'package:kerwenli_yol/pages/categories_page/parts/category_card.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';
import 'package:kerwenli_yol/providers/api/category.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class CategoriesList extends ConsumerWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors ==========
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color bgInnerColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    final AsyncValue<List<CategoryModel>> resultApi = ref.watch(
      fetchCategoriesProvider,
    );

    return Expanded(
      child: Container(
        color: bgColor,
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        child: Container(
          padding: EdgeInsets.all(9),
          color: bgInnerColor,
          child: resultApi.when(
            data: (data) {
              if (data.isEmpty) {
                return NoResult();
              }

              return ListView.builder(
                itemBuilder: (context, index) =>
                    CategoryCard(category: data[index]),
                itemCount: data.length,
              );
            },
            error: (error, stackTrace) => const SizedBox.shrink(),
            loading: () => loadWidget,
          ),
        ),
      ),
    );
  }
}
