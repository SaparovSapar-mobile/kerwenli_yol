import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/pages/bookmark_page/parts/bookmark_companies_list_view.dart';
import 'package:kerwenli_yol/pages/bookmark_page/parts/followed_companies_list_view.dart';
import 'package:kerwenli_yol/pages/bookmark_page/parts/liked_products_list_view.dart';
import 'package:kerwenli_yol/pages/parts/categories_header/parts/head_category_buttons.dart';
import 'package:kerwenli_yol/pages/parts/internet_status_bar/internet_status_bar.dart';
import 'package:kerwenli_yol/pages/parts/app_refresh_indicator.dart';
import 'package:kerwenli_yol/providers/api/company.dart';
import 'package:kerwenli_yol/providers/api/product.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> bh = bookmarkHeaders(context);
    return DefaultTabController(
      length: bh.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InternetStatusBar(),
          HeadCategoryButtons(categories: bh),
          AppBarBottomLine(thickness: 10),
          SizedBox(height: 5),
          Expanded(
            child: TabBarView(
              children: [
                AppRefreshIndicator(
                  providers: [fetchLikedProductsProvider],
                  child: LikedProductsListView(),
                ),
                AppRefreshIndicator(
                  providers: [fetchBookmarkedCompaniesProvider],
                  child: BookmarkCompaniesListView(),
                ),
                AppRefreshIndicator(
                  providers: [fetchFollowedCompaniesProvider],
                  child: FollowedCompaniesListView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
