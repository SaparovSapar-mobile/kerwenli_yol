import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/pages/search_page/parts/search_history.dart';
import 'package:kerwenli_yol/pages/search_page/parts/search_result.dart';
import 'package:kerwenli_yol/providers/pages/search_page.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool openSearchHistory = ref.watch(
      openSearchECommerceHistoryProvider,
    );

    if (openSearchHistory) {
      return SearchHistory();
    } else {
      return SearchResult();
    }
  }
}
