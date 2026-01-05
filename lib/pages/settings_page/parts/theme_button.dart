import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/enums/theme.dart';
import 'package:kerwenli_yol/helpers/methods/pages/bottom_sheets.dart';
import 'package:kerwenli_yol/pages/settings_page/parts/setting_part_card.dart';
import 'package:kerwenli_yol/providers/settings.dart';

class ThemeButton extends ConsumerWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String themeText = '';
    int theme = ref.watch(themeProvider);

    if (theme == ThemeType.system) {
      themeText = 'Sistema temasy';
    } else if (theme == ThemeType.white) {
      themeText = 'Ak Tema';
    } else {
      themeText = 'Gara Tema';
    }

    return SettingPartCard(
      index: 1,
      text: 'Tema',
      icon: Icons.bedtime,
      tralingText: themeText,
      onTap: () => showThemeBottomSheet(context),
    );
  }
}
