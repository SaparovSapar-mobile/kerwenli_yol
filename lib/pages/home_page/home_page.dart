import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_banner/home_banner.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_page_top/home_page_top.dart';

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
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: HomeBanner(
                  height: 122,
                  width: double.infinity,
                  borderRadius: 20,
                ),
              ),
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
