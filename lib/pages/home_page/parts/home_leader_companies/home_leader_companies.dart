import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_categories/parts/home_categories_list.dart';
import 'package:kerwenli_yol/pages/parts/home_more_button.dart';

class HomeLeaderCompanies extends StatelessWidget {
  const HomeLeaderCompanies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HomeMoreButton(text: 'Öňde baryjy kärhanalar', onTap: () {}),
        SizedBox(height: 5),
        HomeCategoriesList(),
      ],
    );
  }
}
