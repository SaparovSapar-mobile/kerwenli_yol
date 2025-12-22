import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/parts/company_page_about/company_page_about.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/parts/company_page_info_card.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/parts/company_page_info_tabbar.dart';
import 'package:kerwenli_yol/pages/parts/card_bookmark_button.dart';
import 'package:kerwenli_yol/pages/parts/card_virtual_button.dart';
import 'package:kerwenli_yol/pages/parts/company_subscribe_button.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class CompanyPageInfo extends ConsumerWidget {
  const CompanyPageInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLight = isLightTheme(context, ref);
    final bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    final tabbarBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;
    final innerBgColor = isLight
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
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: innerBgColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        CompanyPageInfoCard(),
                        const SizedBox(height: 8.8),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  CardBookmarkButton(
                                    width: 26,
                                    height: 26,
                                    iconSize: 16,
                                    bGColor: bgColor,
                                  ),
                                  const SizedBox(width: 4),
                                  CardVirtualButton(bGColor: bgColor),
                                ],
                              ),
                            ),
                            CompanySubscribeButton(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

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
                  child: CompanyPageInfoTabbar(),
                ),
              ),
            ];
          },

          // Tab içerikleri (scroll olacak)
          body: const TabBarView(
            children: [
              _InnerTabScroll(child: CompanyPageAbout()),
              _InnerTabScroll(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Info'),
                ),
              ),
              _InnerTabScroll(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Mumkincilikler'),
                ),
              ),
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
