import 'package:flutter/material.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/companies_list_view.dart';
import 'package:kerwenli_yol/pages/parts/categories_header/categories_header_without_expanded.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoriesHeaderWithoutExpanded(
      categories: searchCategories,
      childWidget: CompaniesListView(),
    );
  }
}
