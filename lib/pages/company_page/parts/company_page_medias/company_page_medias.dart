import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_card.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_part_tabbar.dart';
import 'package:kerwenli_yol/pages/medias_page/parts/medias_grid_view.dart';
import 'package:kerwenli_yol/pages/photos_page/parts/photos_grid_view.dart';
import 'package:kerwenli_yol/pages/wideos_page/parts/wideos_grid_view.dart';
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
                tabTexts: ['Gysga Sekiller', 'Wideolar', 'Fotoreportaz'],
              ),
            ];
          },

          // Tab içerikleri (scroll olacak)
          body: Container(
            color: tabbarViewBgColor,
            child: const TabBarView(
              children: [MediasGridView(), WideosGridView(), PhotosGridView()],
            ),
          ),
        ),
      ),
    );
  }
}
