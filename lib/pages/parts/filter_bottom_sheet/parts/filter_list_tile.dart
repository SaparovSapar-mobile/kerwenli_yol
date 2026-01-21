import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/notifiers/inputs.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class FilterListTile extends ConsumerWidget {
  const FilterListTile({
    super.key,
    required this.value,
    required this.title,
    required this.filtersProvider,
  });

  final int value;
  final String title;
  final StateNotifierProvider<CategoriesNotifier, List<int>> filtersProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    Color activeColor = isLight ? LightColors.primary : DarkColors.primary;

    TextStyle titleStyle = AppTextStyles.medium14;

    List<int> selectedFilters = ref.watch(filtersProvider);
    bool isActive = selectedFilters.contains(value);

    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: borderColor)),
      ),
      child: CheckboxListTile(
        contentPadding: EdgeInsets.only(left: 0),
        activeColor: activeColor,
        title: Text(title, style: titleStyle),
        value: isActive,
        onChanged: (v) =>
            ref.read(filtersProvider.notifier).addOrRemoveCategory(value),
      ),
    );
  }
}
