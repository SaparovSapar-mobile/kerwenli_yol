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

class SearchResult extends ConsumerWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> st = searchTabs(context);
    final AsyncValue<SearchModel> resultApi = ref.watch(fetchSearchProvider);

    return DefaultTabController(
      length: st.length,
      child: Column(
        children: [
          HeadCategoryButtons(categories: st),
          AppBarBottomLine(thickness: 10),
          SizedBox(height: 5),
          resultApi.when(
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
