import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/categories_header/parts/head_category_buttons.dart';

class CategoriesHeader extends StatelessWidget {
  const CategoriesHeader({
    super.key,
    required this.categories,
    required this.childWidget,
  });

  final List<String> categories;
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: categories.length,
        child: Column(
          children: [
            HeadCategoryButtons(categories: categories),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: categories.map((e) => childWidget).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
