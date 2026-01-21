import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/parts/filter_bottom_sheet/parts/filter_list_tile.dart';
import 'package:kerwenli_yol/providers/parts/inputs.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class FilterExpansionTile extends ConsumerWidget {
  const FilterExpansionTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    TextStyle titleStyle = AppTextStyles.semiBold20;

    return ExpansionTile(
      tilePadding: EdgeInsets.only(left: 0),
      title: Text('Söwda nokatlary', style: titleStyle),
      iconColor: iconColor,
      shape: const Border(), // açıkken
      collapsedShape: const Border(), // kapalıyken
      children: [
        FilterListTile(
          title: 'Maslahat berilýänler',
          value: 0,
          filtersProvider: categoriesProvider,
        ),
        FilterListTile(
          title: 'Iň ýakyn',
          value: 1,
          filtersProvider: categoriesProvider,
        ),
      ],
    );
  }
}
