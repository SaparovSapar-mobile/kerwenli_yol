import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/parts/company_page_info_card.dart';
import 'package:kerwenli_yol/pages/parts/card_bookmark_button.dart';
import 'package:kerwenli_yol/pages/parts/card_virtual_button.dart';
import 'package:kerwenli_yol/pages/parts/company_subscribe_button.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class CompanyPageInfo extends ConsumerWidget {
  const CompanyPageInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    Color innerBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    return Container(
      color: bgColor,
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: innerBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            CompanyPageInfoCard(),
            SizedBox(height: 8.8),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CardBookmarkButton(
                        width: 26,
                        height: 26,
                        iconSize: 16,
                        bGColor: isLight
                            ? LightColors.bgPageLight
                            : DarkColors.bgPageDark,
                      ),
                      SizedBox(width: 4),
                      CardVirtualButton(
                        bGColor: isLight
                            ? LightColors.bgPageLight
                            : DarkColors.bgPageDark,
                      ),
                    ],
                  ),
                ),
                CompanySubscribeButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
