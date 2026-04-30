import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/models/search.dart';
import 'package:kerwenli_yol/pages/parts/categories_header/parts/head_category_buttons.dart';
import 'package:kerwenli_yol/pages/search_page/parts/search_companies.dart';
import 'package:kerwenli_yol/pages/search_page/parts/search_marks.dart';
import 'package:kerwenli_yol/pages/search_page/parts/search_medias.dart';
import 'package:kerwenli_yol/pages/search_page/parts/search_news.dart';
import 'package:kerwenli_yol/pages/search_page/parts/search_products.dart';
import 'package:kerwenli_yol/providers/api/search.dart';
import 'package:kerwenli_yol/providers/parts/file_upload.dart';

class SearchResult extends ConsumerWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> st = searchTabs(context);

    final bool isVisualSearch = ref.watch(isVisualSearchModeProvider);
    final SearchModel? visualResult = ref.watch(visualSearchResultProvider);

    final AsyncValue<SearchModel> textResult = ref.watch(fetchSearchProvider);

    return DefaultTabController(
      length: st.length,
      child: Column(
        children: [
          HeadCategoryButtons(categories: st),
          AppBarBottomLine(thickness: 10),
          const SizedBox(height: 5),

          if (isVisualSearch && visualResult != null)
            Expanded(
              child: TabBarView(
                children: [
                  SearchProducts(products: visualResult.products),
                  SearchCompanies(companies: visualResult.companies),
                  SearchNews(news: visualResult.news),
                  SearchMarks(marks: visualResult.marks),
                  SearchMedias(medias: visualResult.media),
                ],
              ),
            )
          else
            textResult.when(
              data: (data) {
                return Expanded(
                  child: TabBarView(
                    children: [
                      SearchProducts(products: data.products),
                      SearchCompanies(companies: data.companies),
                      SearchNews(news: data.news),
                      SearchMarks(marks: data.marks),
                      SearchMedias(medias: data.media),
                    ],
                  ),
                );
              },
              error: (_, _) => const SizedBox.shrink(),
              loading: () => loadWidget,
            ),
        ],
      ),
    );
  }
}
