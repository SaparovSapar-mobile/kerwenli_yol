import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_card.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/parts/company_features/company_features.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/parts/company_info/company_info.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/parts/company_page_about/company_page_about.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_part_tabbar.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class CompanyPageInfo extends ConsumerWidget {
  const CompanyPageInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors ========
    final isLight = isLightTheme(context, ref);
    final bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;

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
                tabTexts: ['Biz Barada', 'Info', 'Mumkincilikler'],
              ),
            ];
          },

          // Tab içerikleri (scroll olacak)
          body: const TabBarView(
            children: [
              _InnerTabScroll(child: CompanyPageAbout()),
              _InnerTabScroll(child: CompanyInfo()),
              _InnerTabScroll(child: CompanyFeatures()),
            ],
          ),
        ),
      ),
    );
  }
}

class _InnerTabScroll extends StatelessWidget {
  const _InnerTabScroll({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: child);
  }
}
