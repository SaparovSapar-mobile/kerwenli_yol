import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class SortListTileWithIcon extends ConsumerWidget {
  const SortListTileWithIcon({
    super.key,
    required this.value,
    required this.title,
    required this.sortOrFilterProvider,
    required this.icon,
  });

  final int value;
  final String title;
  final StateProvider<int> sortOrFilterProvider;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========= Colors ========
    final bool isLight = isLightTheme(context, ref);
    Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    Color activeColor = isLight ? LightColors.primary : DarkColors.primary;
    Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    // ========= Text Styles ========
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
        title: Row(
          children: [
            Icon(icon, size: 20, color: iconColor),
            SizedBox(width: 12),
            Text(title, style: titleStyle),
          ],
        ),
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
