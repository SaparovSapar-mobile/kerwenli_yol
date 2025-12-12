import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_categories/parts/home_categories_list.dart';
import 'package:kerwenli_yol/pages/parts/home_more_button.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HomeMoreButton(text: 'Kategoriýalar', onTap: () {}),
        SizedBox(height: 5),
        HomeCategoriesList(),
        SizedBox(height: 10),
        AppBarBottomLine(thickness: 10),
      ],
    );
  }
}
