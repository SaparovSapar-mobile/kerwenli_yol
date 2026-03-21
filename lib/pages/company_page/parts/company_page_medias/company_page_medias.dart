import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_medias/parts/company_medias_gridview.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_part_tabbar.dart';
import 'package:kerwenli_yol/pages/photos_page/parts/photos_grid_view.dart';
import 'package:kerwenli_yol/pages/wideos_page/parts/wideos_grid_view.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class CompanyPageMedias extends ConsumerWidget {
  const CompanyPageMedias({super.key, required this.companyId});

  final String companyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ====== Colors =====
    final isLight = isLightTheme(context, ref);
    final tabbarViewBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          CompanyPagePartTabbar(
            tabTexts: ['Gysga Sekiller', 'Wideolar', 'Fotoreportaz'],
          ),
          Expanded(
            child: Container(
              color: tabbarViewBgColor,
              child: TabBarView(
                children: [
                  CompanyMediasGridview(companyId: companyId),
                  WideosGridView(),
                  PhotosGridView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
