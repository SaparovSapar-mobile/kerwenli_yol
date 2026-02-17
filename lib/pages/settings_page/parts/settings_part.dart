import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/settings_page/parts/language_button.dart';
import 'package:kerwenli_yol/pages/settings_page/parts/setting_part_card.dart';
import 'package:kerwenli_yol/pages/settings_page/parts/setting_passcode_button.dart';
import 'package:kerwenli_yol/pages/settings_page/parts/theme_button.dart';
import 'package:kerwenli_yol/providers/pages/settings_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class SettingsPart extends ConsumerWidget {
  const SettingsPart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========= Colors ==========
    final bool isLight = isLightTheme(context, ref);
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
          Text('Sazlamalar'),
          SizedBox(height: 5),
          LanguageButton(),
          ThemeButton(),
          SettingPartCard(
            index: 2,
            text: 'Sesli bildirisler',
            icon: Icons.notifications,
            settingProvider: openNotificationProvider,
          ),
          SettingPasscodeButton(index: 3),
        ],
      ),
    );
  }
}
