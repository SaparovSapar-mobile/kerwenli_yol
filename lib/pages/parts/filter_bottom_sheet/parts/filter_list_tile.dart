import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class FilterListTile extends ConsumerWidget {
  const FilterListTile({
    super.key,
    required this.title,
    required this.isActive,
    required this.onChanged,
  });

  final String title;
  final bool isActive;
  final void Function(bool value) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = isLightTheme(context, ref);
    final Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color activeColor = isLight
        ? LightColors.primary
        : DarkColors.primary;
    final Color boxBorderColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    final TextStyle titleStyle = AppTextStyles.medium14;

    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: borderColor)),
      ),
      child: CheckboxListTile(
        contentPadding: EdgeInsets.only(left: 0),
        controlAffinity: ListTileControlAffinity.trailing,
        activeColor: activeColor,
        side: BorderSide(width: 1.5, color: boxBorderColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        title: Text(title, style: titleStyle),
        value: isActive,
        onChanged: (v) => onChanged(v ?? false),
      ),
    );
  }
}
