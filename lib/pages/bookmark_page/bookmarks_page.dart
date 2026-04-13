import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/pages/bookmarks_page.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/pages/bookmark_page/parts/bookmark_companies_list_view.dart';
import 'package:kerwenli_yol/pages/bookmark_page/parts/followed_companies_list_view.dart';
import 'package:kerwenli_yol/pages/bookmark_page/parts/liked_products_list_view.dart';
import 'package:kerwenli_yol/pages/parts/categories_header/parts/head_category_buttons.dart';
import 'package:kerwenli_yol/pages/parts/internet_status_bar/internet_status_bar.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> bh = bookmarkHeaders(context);
    return Scaffold(
      appBar: bookmarsPageAppBar(context),
      body: DefaultTabController(
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
                  LikedProductsListView(),
                  BookmarkCompaniesListView(),
                  FollowedCompaniesListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
