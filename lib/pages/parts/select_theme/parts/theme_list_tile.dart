import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/providers/settings.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class ThemeListTile extends ConsumerWidget {
  const ThemeListTile({
    super.key,
    required this.title,
    required this.theme,
    required this.icon,
  });

  final String title;
  final int theme;

  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedTheme = ref.watch(themeProvider);
    bool isActive = selectedTheme == theme;

    final bool isLight = isLightTheme(context, ref);
    Color leadingBgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    Color activeLeadingBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;
    Color tralingIconColor = isLight ? LightColors.primary : DarkColors.primary;
    Color leadingColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    TextStyle titleStyle = AppTextStyles.medium12;

    return Container(
      decoration: BoxDecoration(
        color: isActive ? leadingBgColor : activeLeadingBgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        dense: true,
        visualDensity: VisualDensity.compact,
        contentPadding: EdgeInsets.only(left: 5, right: 10),
        leading: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isActive ? activeLeadingBgColor : leadingBgColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(
            icon,
            size: 16,
            color: isActive ? tralingIconColor : leadingColor,
          ),
        ),
        title: Text(title, style: titleStyle),
        trailing: isActive
            ? CircleAvatar(backgroundColor: tralingIconColor, radius: 3)
            : const SizedBox.shrink(),
        onTap: () async {
          await ref.read(themeProvider.notifier).update(theme);
          if (context.mounted) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
