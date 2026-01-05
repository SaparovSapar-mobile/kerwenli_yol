import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/pages/bottom_sheets.dart';
import 'package:kerwenli_yol/pages/settings_page/parts/setting_part_card.dart';
import 'package:kerwenli_yol/providers/settings.dart';

class LanguageButton extends ConsumerWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String langText = '';
    String lang = ref.watch(langProvider);

    if (lang == 'tr') {
      langText = 'Türkmençe';
    } else if (lang == 'ru') {
      langText = 'Русский';
    } else {
      langText = 'English';
    }

    return SettingPartCard(
      index: 0,
      text: 'Diller',
      icon: Icons.translate,
      tralingText: langText,
      onTap: () => showLanguageBottomSheet(context),
    );
  }
}
