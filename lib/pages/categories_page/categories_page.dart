import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/pages/categories_page/parts/categories_list.dart';
import 'package:kerwenli_yol/pages/categories_page/parts/header_categories.dart';
import 'package:kerwenli_yol/pages/parts/internet_status_bar/internet_status_bar.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAppBar(context),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [InternetStatusBar(), HeaderCategories(), CategoriesList()],
      ),
    );
  }
}
