import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/settings_page/parts/setting_part_card.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class AccountPart extends ConsumerWidget {
  const AccountPart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          Text('Akkount'),
          SizedBox(height: 5),
          SettingPartCard(
            index: 8,
            text: 'Akkountdan cykmak',
            icon: Icons.logout,
            onTap: () {},
          ),
          SettingPartCard(
            index: 9,
            text: 'Hasabymy pozmak',
            icon: Icons.delete_forever,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
