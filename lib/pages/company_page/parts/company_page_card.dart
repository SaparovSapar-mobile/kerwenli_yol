import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/parts/company_page_info_card.dart';
import 'package:kerwenli_yol/pages/parts/card_bookmark_button.dart';
import 'package:kerwenli_yol/pages/parts/card_virtual_button.dart';
import 'package:kerwenli_yol/pages/parts/company_subscribe_button.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class CompanyPageCard extends ConsumerWidget {
  const CompanyPageCard({super.key, required this.company});

  final CompanyDetailModel company;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ====== Colors =====
    final isLight = isLightTheme(context, ref);
    final bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    final innerBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(10),
        color: bgColor,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: innerBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              CompanyPageInfoCard(company: company),
              const SizedBox(height: 8.8),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        CardBookmarkButton(
                          companyId: company.id,
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
                  CompanySubscribeButton(companyId: company.id),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
