import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/settings_page/parts/about_part.dart';
import 'package:kerwenli_yol/pages/settings_page/parts/settings_part.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      color: bgColor,
      child: Column(
        children: [SettingsPart(), SizedBox(height: 10), AboutPart()],
      ),
    );
  }
}
