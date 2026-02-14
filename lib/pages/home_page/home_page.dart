import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_categories/home_categories.dart';
// import 'package:kerwenli_yol/pages/home_page/parts/home_banners/home_banners.dart';
// import 'package:kerwenli_yol/pages/home_page/parts/home_graditutes/home_graditutes.dart';
// import 'package:kerwenli_yol/pages/home_page/parts/home_leader_companies/home_leader_companies.dart';
// import 'package:kerwenli_yol/pages/home_page/parts/home_media/home_media.dart';
// import 'package:kerwenli_yol/pages/home_page/parts/home_new_products/home_new_products.dart';
// import 'package:kerwenli_yol/pages/home_page/parts/home_news/home_news.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_page_top/home_page_top.dart';
// import 'package:kerwenli_yol/pages/home_page/parts/home_partners/home_partners.dart';
// import 'package:kerwenli_yol/pages/home_page/parts/home_second_banner.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/home_vip_companies.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_virtuals/home_virtuals.dart';
// import 'package:kerwenli_yol/pages/home_page/parts/home_virtuals/home_virtuals.dart';

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
              // HomeBanners(),
              // AppBarBottomLine(thickness: 10),
              HomeCategories(),
              // HomeLeaderCompanies(),
              HomeVipCompanies(),
              // HomeNewProducts(),
              HomeVirtuals(),
              // HomeMedia(),
              // HomeNews(),
              // HomeSecondBanner(),
              // HomePartners(),
              // HomeGraditutes(),
            ],
          ),
        ),
      ],
    );
  }
}
