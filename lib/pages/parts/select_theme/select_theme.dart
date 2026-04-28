import 'package:flutter/material.dart';
import 'package:kerwenli_yol/enums/theme.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/bottom_sheet_title.dart';
import 'package:kerwenli_yol/pages/parts/select_theme/parts/theme_list_tile.dart';

class SelectTheme extends StatelessWidget {
  const SelectTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    return BottomSheetWidget(
      children: [
        BottomSheetTitle(text: lang.theme),
        ThemeListTile(
          title: lang.lightTheme,
          theme: ThemeType.white,
          icon: Icons.light_mode,
        ),
        ThemeListTile(
          title: lang.darkTheme,
          theme: ThemeType.black,
          icon: Icons.bedtime,
        ),
        ThemeListTile(
          title: lang.systemTheme,
          theme: ThemeType.system,
          icon: Icons.mobile_screen_share_rounded,
        ),
      ],
    );
  }
}
