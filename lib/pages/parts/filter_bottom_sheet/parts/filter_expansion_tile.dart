import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/category.dart';
import 'package:kerwenli_yol/pages/parts/filter_bottom_sheet/parts/filter_list_tile.dart';
import 'package:kerwenli_yol/providers/parts/inputs.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class FilterExpansionTile extends ConsumerWidget {
  const FilterExpansionTile({
    super.key,
    required this.category,
    this.initiallyExpanded = false,
  });

  final CategoryModel category;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    final bool isLight = isLightTheme(context, ref);
    final Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    final TextStyle titleStyle = AppTextStyles.semiBold20;

    final String categoryName = translateText(
      ref,
      category.nameTm,
      category.nameRu,
      category.nameEn,
      category.nameEn,
    );

    final List<String> subIds = category.subCategories
        .map((e) => e.id)
        .toList();
    final List<String> selected = ref.watch(subCategoryFiltersProvider);
    final bool isAllSelected =
        subIds.isNotEmpty && subIds.every(selected.contains);

    return ExpansionTile(
      tilePadding: EdgeInsets.only(left: 0),
      childrenPadding: EdgeInsets.only(left: 0),
      initiallyExpanded: initiallyExpanded,
      title: Text(categoryName, style: titleStyle),
      iconColor: iconColor,
      collapsedIconColor: iconColor,
      shape: const Border(),
      collapsedShape: const Border(),
      children: [
        FilterListTile(
          title: lang.all,
          isActive: isAllSelected,
          onChanged: (v) =>
              ref.read(subCategoryFiltersProvider.notifier).toggleAll(subIds, v),
        ),
        ...category.subCategories.map(
          (sub) => FilterListTile(
            title: translateText(
              ref,
              sub.nameTm,
              sub.nameRu,
              sub.nameEn,
              sub.nameTr,
            ),
            isActive: selected.contains(sub.id),
            onChanged: (_) =>
                ref.read(subCategoryFiltersProvider.notifier).addOrRemove(sub.id),
          ),
        ),
      ],
    );
  }
}
