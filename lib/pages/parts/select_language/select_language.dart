import 'package:flutter/material.dart';
import 'package:kerwenli_yol/enums/lang_type.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/bottom_sheet_title.dart';
import 'package:kerwenli_yol/pages/parts/select_language/parts/language_list_tile.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      children: [
        BottomSheetTitle(text: 'Diller'),
        const LanguageListTile(
          title: 'Türkmençe',
          lang: LangType.tr,
          image: 'tkm.png',
        ),
        const LanguageListTile(
          title: 'Русский',
          lang: LangType.ru,
          image: 'ru.png',
        ),
        const LanguageListTile(
          title: 'English',
          lang: LangType.en,
          image: 'en.png',
        ),
      ],
    );
  }
}
