import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/enums/theme.dart';
import 'package:kerwenli_yol/helpers/methods/pages/bottom_sheets.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/settings_page/parts/setting_part_card.dart';
import 'package:kerwenli_yol/providers/settings.dart';

class ThemeButton extends ConsumerWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    String themeText = '';
    int theme = ref.watch(themeProvider);

    if (theme == ThemeType.system) {
      themeText = lang.systemTheme;
    } else if (theme == ThemeType.white) {
      themeText = lang.lightTheme;
    } else {
      themeText = lang.darkTheme;
    }

    return SettingPartCard(
      index: 1,
      text: lang.theme,
      icon: Icons.bedtime,
      tralingText: themeText,
      onTap: () => showThemeBottomSheet(context),
    );
  }
}
