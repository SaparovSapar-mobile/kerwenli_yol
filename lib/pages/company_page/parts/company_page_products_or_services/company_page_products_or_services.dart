import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_card.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_part_tabbar.dart';
import 'package:kerwenli_yol/pages/products_page/parts/products_grid_view.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class CompanyPageProductsOrServices extends ConsumerWidget {
  const CompanyPageProductsOrServices({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors ===========
    final isLight = isLightTheme(context, ref);
    final bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    final tabbarViewBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    return DefaultTabController(
      length: 3,
      child: Container(
        color: bgColor,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              // ÜST KART (scroll’a dahil)
              CompanyPageCard(),

              // ✅ TabBar’ı SliverAppBar ile pinle (yükseklik sorunu bitiyor)
              CompanyPagePartTabbar(
                tabTexts: ['Kategoriya 1', 'Kategoriya 2', 'Kategoriya 3'],
              ),
            ];
          },

          // Tab içerikleri (scroll olacak)
          body: Container(
            padding: EdgeInsets.only(top: 10),
            color: tabbarViewBgColor,
            child: const TabBarView(
              children: [
                ProductsGridView(),
                ProductsGridView(),
                ProductsGridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
