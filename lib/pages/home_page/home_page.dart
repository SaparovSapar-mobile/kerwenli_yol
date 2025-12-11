import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_page_top/home_page_top.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomePageTop(),
        AppBarBottomLine(thickness: 10),
        // ListView(
        //   children: [
        //     HomeCarouselSlider(),
        //     HomeParts(),
        //     SizedBox(height: 10),
        //     // HomeBrands(),
        //   ],
        // ),
      ],
    );
  }
}
