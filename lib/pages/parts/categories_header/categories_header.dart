import 'package:flutter/material.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/pages/parts/categories_header/parts/head_category_card.dart';

class CategoriesHeader extends StatelessWidget {
  const CategoriesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            HeadCategoryCard(index: index, text: headerCategories[index]),
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemCount: headerCategories.length,
      ),
    );
  }
}
