import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/cp_message_bs/cp_message_bs.dart';
import 'package:kerwenli_yol/pages/parts/filter_bottom_sheet/filter_bottom_sheet.dart';
import 'package:kerwenli_yol/pages/parts/message_bs/message_bs.dart';
import 'package:kerwenli_yol/pages/parts/select_language/select_language.dart';
import 'package:kerwenli_yol/pages/parts/select_theme/select_theme.dart';
import 'package:kerwenli_yol/pages/parts/sort_bottom_sheet/sort_bottom_sheet.dart';

Future<void> showLanguageBottomSheet(BuildContext context) async =>
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const SelectLanguage(),
    );

Future<void> showThemeBottomSheet(BuildContext context) async =>
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const SelectTheme(),
    );

Future<void> showSortBottomSheet(BuildContext context) async =>
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const SortBottomSheet(),
    );

Future<void> showFilterBottomSheet(BuildContext context) async =>
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const FilterBottomSheet(),
    );

Future<void> showCompanyPageMessageBottomSheet(BuildContext context) async =>
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const CpMessageBs(),
    );

Future<void> showSelectImageBottomSheet(BuildContext context) async =>
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const CpMessageBs(),
    );

Future<void> showMessageBottomSheet(
  BuildContext context,
  String title,
  String image,
) async => await showModalBottomSheet(
  backgroundColor: Colors.transparent,
  isScrollControlled: true,
  context: context,
  builder: (context) => MessageBs(title: title, image: image),
);
