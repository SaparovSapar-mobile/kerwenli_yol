import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/pages/parts/book_mark_setting_bs/book_mark_setting_bs.dart';
import 'package:kerwenli_yol/pages/parts/cp_message_bs/cp_message_bs.dart';
import 'package:kerwenli_yol/pages/parts/filter_bottom_sheet/filter_bottom_sheet.dart';
import 'package:kerwenli_yol/pages/parts/log_out_bottom_sheet/log_out_bottom_sheet.dart';
import 'package:kerwenli_yol/pages/parts/message_bs/message_bs.dart';
import 'package:kerwenli_yol/pages/parts/select_image_bs/select_image_bs.dart';
import 'package:kerwenli_yol/pages/parts/select_language/select_language.dart';
import 'package:kerwenli_yol/pages/parts/select_theme/select_theme.dart';
import 'package:kerwenli_yol/pages/parts/sort_bottom_sheet/grid_or_list_bottom_sheet.dart';
import 'package:kerwenli_yol/pages/parts/sort_bottom_sheet/sort_bottom_sheet.dart';

Future<void> showLanguageBottomSheet(BuildContext context) async =>
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const SelectLanguage(),
    );

Future<void> showLougOutBottomSheet(BuildContext context) async =>
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const LogOutBottomSheet(),
    );

Future<void> showThemeBottomSheet(BuildContext context) async =>
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const SelectTheme(),
    );

Future<void> showSortBottomSheet(
  BuildContext context,
  StateProvider<int> gridOrListProvider,
  StateProvider<bool> isGridProvider,
) async => await showModalBottomSheet(
  backgroundColor: Colors.transparent,
  context: context,
  builder: (context) => SortBottomSheet(
    gridOrListProvider: gridOrListProvider,
    isGridProvider: isGridProvider,
  ),
);

Future<void> showGridOrListSortBottomSheet(
  BuildContext context,
  StateProvider<int> gridOrListProvider,
  StateProvider<bool> isGridProvider,
) async => await showModalBottomSheet(
  backgroundColor: Colors.transparent,
  context: context,
  builder: (context) => GridOrListBottomSheet(
    gridOrListProvider: gridOrListProvider,
    isGridProvider: isGridProvider,
  ),
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

Future<void> showBookmarkSettingBottomSheet(BuildContext context) async =>
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const BookMarkSettingBs(),
    );

Future<void> showSelectImageBottomSheet(BuildContext context) async =>
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const SelectImageBs(),
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
