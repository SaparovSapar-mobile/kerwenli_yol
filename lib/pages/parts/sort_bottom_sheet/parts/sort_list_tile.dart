import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class SortListTile extends ConsumerWidget {
  const SortListTile({
    super.key,
    required this.value,
    required this.title,
    required this.sortOrFilterProvider,
  });

  final int value;
  final String title;
  final StateProvider<int> sortOrFilterProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = isLightTheme(context, ref);
    Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    Color activeColor = isLight ? LightColors.primary : DarkColors.primary;

    TextStyle titleStyle = AppTextStyles.medium14;

    int selectedIndex = ref.watch(sortOrFilterProvider);

    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: borderColor)),
      ),
      child: RadioListTile<int>(
        contentPadding: EdgeInsets.only(left: 0),
        activeColor: activeColor,
        controlAffinity: ListTileControlAffinity.trailing,
        title: Text(title, style: titleStyle),
        value: value,
        groupValue: selectedIndex,
        onChanged: (v) {
          if (v != null) {
            ref.read(sortOrFilterProvider.notifier).state = v;
          }
        },
      ),
    );
  }
}
