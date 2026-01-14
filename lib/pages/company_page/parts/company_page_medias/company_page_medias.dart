import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_card.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_products_or_services/parts/company_page_p_or_s_tabbar.dart';
import 'package:kerwenli_yol/pages/products_page/parts/products_list_view.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class CompanyPageMedias extends ConsumerWidget {
  const CompanyPageMedias({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ====== Colors =====
    final isLight = isLightTheme(context, ref);
    final bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    final tabbarViewBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;
    final tabbarBgColor = isLight
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
              SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                backgroundColor: tabbarBgColor,
                elevation: 0,
                toolbarHeight: 0, // sadece TabBar görünsün
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(
                    48,
                  ), // burası TabBar'ın min yüksekliği
                  child: CompanyPagePOrSTabbar(),
                ),
              ),
            ];
          },

          // Tab içerikleri (scroll olacak)
          body: Container(
            color: tabbarViewBgColor,
            child: const TabBarView(
              children: [
                ProductsListView(),
                ProductsListView(),
                ProductsListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
