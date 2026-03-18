import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/pages/bottom_sheets.dart';
import 'package:kerwenli_yol/providers/parts/grid_or_list.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class CompanyPageProductsSortButton extends ConsumerWidget {
  const CompanyPageProductsSortButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // =========== Colors =========
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    return GestureDetector(
      onTap: () => showGridOrListSortBottomSheet(
        context,
        gridOrListProductsProvider,
        isGridProductsProvider,
      ),
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(Icons.sort, size: 16, color: iconColor),
      ),
    );
  }
}
