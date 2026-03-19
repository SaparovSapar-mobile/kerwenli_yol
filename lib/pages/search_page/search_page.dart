import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/pages/parts/categories_header/categories_header_without_expanded.dart';
import 'package:kerwenli_yol/providers/pages/search_page.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool openSearchHistory = ref.watch(
      openSearchECommerceHistoryProvider,
    );

    return CategoriesHeaderWithoutExpanded(
      categories: searchCategories,
      childWidget: openSearchHistory
          ? Center(child: Text('Search History'))
          : Center(child: Text('Search Result')),
    );
  }
}
