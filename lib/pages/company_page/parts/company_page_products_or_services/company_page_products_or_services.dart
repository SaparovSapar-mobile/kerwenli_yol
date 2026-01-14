import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/parts/company_page_info_card.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_products_or_services/parts/company_page_p_or_s_tabbar.dart';
import 'package:kerwenli_yol/pages/parts/card_bookmark_button.dart';
import 'package:kerwenli_yol/pages/parts/card_virtual_button.dart';
import 'package:kerwenli_yol/pages/parts/company_subscribe_button.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class CompanyPageProductsOrServices extends ConsumerWidget {
  const CompanyPageProductsOrServices({super.key});

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
                  child: CompanyPagePOrSTabbar(),
                ),
              ),
            ];
          },

          // Tab içerikleri (scroll olacak)
          body: const TabBarView(
            children: [
              _InnerTabScroll(child: Text('Kategoriya 1')),
              _InnerTabScroll(child: Text('Kategoriya 2')),
              _InnerTabScroll(child: Text('Kategoriya 3')),
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
