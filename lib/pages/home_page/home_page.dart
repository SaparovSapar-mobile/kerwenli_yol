import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_banners/home_banners.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_page_top/home_page_top.dart';
import 'package:kerwenli_yol/pages/parts/home_more_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomePageTop(),
        AppBarBottomLine(thickness: 10),
        Expanded(
          child: ListView(
            children: [
              HomeBanners(),
              AppBarBottomLine(thickness: 10),
              HomeMoreButton(text: 'Kategoriýalar', onTap: () {}),
              // HomeParts(),
              SizedBox(height: 10),
              // HomeBrands(),
            ],
          ),
        ),
      ],
    );
  }
}
