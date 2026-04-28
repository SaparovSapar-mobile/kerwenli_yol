import 'package:flutter/material.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/parts/bg_page_light_button.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/bottom_sheet_title.dart';

class BookMarkSettingBs extends StatelessWidget {
  const BookMarkSettingBs({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    return BottomSheetWidget(
      children: [
        BottomSheetTitle(text: lang.settings),
        SizedBox(height: 10),
        BgPageLightButton(
          text: lang.deleteAllBookmarks,
          onPressed: () {},
          icon: Icons.delete,
        ),
      ],
    );
  }
}
