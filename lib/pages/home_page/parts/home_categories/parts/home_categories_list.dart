import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/category.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_categories/parts/home_category_card.dart';

class HomeCategoriesList extends StatelessWidget {
  const HomeCategoriesList({super.key, required this.categories});

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: homeCategoriesCardHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => HomeCategoryCard(
          isFirst: index == 0,
          isLast: index == 9,
          category: categories[index],
        ),
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: categories.length,
      ),
    );
  }
}
