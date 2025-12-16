import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/categories_page/parts/category_card.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class CategoriesList extends ConsumerWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    Color bgInnerColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    return Expanded(
      child: Container(
        color: bgColor,
        padding: EdgeInsets.all(16),
        child: Container(
          padding: EdgeInsets.all(9),
          color: bgInnerColor,
          child: ListView.builder(
            itemBuilder: (context, index) => CategoryCard(),
            itemCount: 20,
          ),
        ),
      ),
    );
  }
}
