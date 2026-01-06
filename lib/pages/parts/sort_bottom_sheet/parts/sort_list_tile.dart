import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/providers/pages/companies_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class SortListTile extends ConsumerWidget {
  const SortListTile({super.key, required this.value, required this.title});

  final int value;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    Color activeColor = isLight ? LightColors.primary : DarkColors.primary;

    TextStyle titleStyle = AppTextStyles.medium14;

    int companySortIndex = ref.watch(companySortIndexProvider);

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
        groupValue: companySortIndex,
        onChanged: (v) {
          if (v != null) {
            ref.read(companySortIndexProvider.notifier).state = v;
          }
        },
      ),
    );
  }
}
