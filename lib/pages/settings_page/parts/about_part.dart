import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/about_us_page/about_us_page.dart';
import 'package:kerwenli_yol/pages/settings_page/parts/setting_part_card.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class AboutPart extends ConsumerWidget {
  const AboutPart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ====== Colors. ==========
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgBlogLight : DarkColors.bgBlogDark;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Biz Barada'),
          SizedBox(height: 5),
          SettingPartCard(
            index: 4,
            text: 'Karhana barada',
            icon: Icons.info,
            onTap: () => goToPage(context, AboutUsPage(), AxisDirection.left),
          ),
          SettingPartCard(
            index: 5,
            text: 'Biz bilen habarlasmak',
            icon: Icons.support_agent,
            onTap: () {},
          ),
          SettingPartCard(index: 6, text: 'Hat yazmak', icon: Icons.forum),
          SettingPartCard(
            index: 7,
            text: 'Gizlinllik syyasaty',
            icon: Icons.privacy_tip,
          ),
        ],
      ),
    );
  }
}
