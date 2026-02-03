import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_news/parts/home_news_list.dart';
import 'package:kerwenli_yol/pages/parts/home_more_button.dart';

class HomeNews extends StatelessWidget {
  const HomeNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HomeMoreButton(text: 'Tazelikler', onTap: () {}),
        Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 10),
          child: HomeNewsList(),
        ),
        AppBarBottomLine(thickness: 10),
      ],
    );
  }
}
