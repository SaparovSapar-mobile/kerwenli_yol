import 'package:flutter/material.dart';
import 'package:kerwenli_yol/enums/theme.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/bottom_sheet_title.dart';
import 'package:kerwenli_yol/pages/parts/select_theme/parts/theme_list_tile.dart';

class SelectTheme extends StatelessWidget {
  const SelectTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      children: [
        BottomSheetTitle(text: 'Tema'),
        const ThemeListTile(
          title: 'Light',
          theme: ThemeType.white,
          icon: Icons.light_mode,
        ),
        const ThemeListTile(
          title: 'Dark',
          theme: ThemeType.black,
          icon: Icons.bedtime,
        ),
        const ThemeListTile(
          title: 'Sistema Temasy',
          theme: ThemeType.system,
          icon: Icons.mobile_screen_share_rounded,
        ),
      ],
    );
  }
}
