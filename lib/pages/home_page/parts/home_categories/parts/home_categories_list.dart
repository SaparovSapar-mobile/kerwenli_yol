import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_categories/parts/home_category_card.dart';

class HomeCategoriesList extends StatelessWidget {
  const HomeCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            HomeCategoryCard(isFirst: index == 0, isLast: index == 9),
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: 10,
      ),
    );
  }
}
