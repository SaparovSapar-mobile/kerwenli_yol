import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/categories_header/categories_header_without_expanded.dart';

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
      child: CategoriesHeaderWithoutExpanded(
        categories: categories,
        childWidget: childWidget,
      ),
    );
  }
}
