import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_banners/home_banners.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_categories/home_categories.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_leader_companies/home_leader_companies.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_new_products/home_new_products.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_page_top/home_page_top.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_partners_slider/home_partners_slider.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/home_vip_companies.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_virtuals/home_virtuals.dart';
import 'package:kerwenli_yol/providers/parts/scroll_to_top.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollCtrl = ref.watch(mainPageScrollCtrlProvider);

    return Column(
      children: [
        HomePageTop(),
        AppBarBottomLine(thickness: 10),
        Expanded(
          child: ListView(
            controller: scrollCtrl,
            children: [
              HomeBanners(),
              AppBarBottomLine(thickness: 10),
              HomeCategories(),
              HomeLeaderCompanies(),
              HomeVipCompanies(),
              HomeNewProducts(),
              HomeVirtuals(),

              // HomeMedia(),
              // HomeNews(),
              // HomeSecondBanner(),
              HomePartnersSlider(),
              // HomePartners(),
              // HomeGraditutes(),
            ],
          ),
        ),
      ],
    );
  }
}
