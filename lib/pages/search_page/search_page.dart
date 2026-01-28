import 'package:flutter/material.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/pages/parts/categories_header/categories_header_without_expanded.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoriesHeaderWithoutExpanded(
      categories: searchCategories,
      childWidget: Center(child: Text('Gozleg netijesi')),
    );
  }
}
