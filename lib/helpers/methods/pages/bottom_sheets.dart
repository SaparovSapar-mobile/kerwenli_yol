import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/select_language/select_language.dart';

Future<void> showLanguageBottomSheet(BuildContext context) async =>
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const SelectLanguage(),
    );
