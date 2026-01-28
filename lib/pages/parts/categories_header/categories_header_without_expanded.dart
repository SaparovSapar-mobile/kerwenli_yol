import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/parts/categories_header/parts/head_category_buttons.dart';

class CategoriesHeaderWithoutExpanded extends StatelessWidget {
  const CategoriesHeaderWithoutExpanded({
    super.key,
    required this.categories,
    required this.childWidget,
  });

  final List<String> categories;
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Column(
        children: [
          HeadCategoryButtons(categories: categories),
          AppBarBottomLine(thickness: 10),
          SizedBox(height: 5),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: categories.map((e) => childWidget).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
