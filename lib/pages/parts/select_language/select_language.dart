import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/bottom_sheet_title.dart';
import 'package:kerwenli_yol/pages/parts/select_language/parts/language_list_tile.dart';

class SelectLanguage extends ConsumerWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomSheetWidget(
      children: [
        BottomSheetTitle(text: 'Diller'),
        const LanguageListTile(
          title: 'Türkmençe',
          lang: 'tr',
          image: 'tkm.png',
        ),
        const LanguageListTile(title: 'Русский', lang: 'ru', image: 'ru.png'),
        const LanguageListTile(title: 'English', lang: 'en', image: 'en.png'),
      ],
    );
  }
}
