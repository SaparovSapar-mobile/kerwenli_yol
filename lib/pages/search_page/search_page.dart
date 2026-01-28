import 'package:flutter/material.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/pages/parts/categories_header/parts/head_category_buttons.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: searchCategories.length,
      child: Column(
        children: [HeadCategoryButtons(categories: searchCategories)],
      ),
    );
  }
}
