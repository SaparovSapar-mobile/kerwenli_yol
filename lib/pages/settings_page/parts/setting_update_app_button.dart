import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/providers/pages/settings_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class SettingUpdateAppButton extends ConsumerWidget {
  const SettingUpdateAppButton({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // =========== Colors =============
    bool isLight = isLightTheme(context, ref);
    Color leadingBgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    Color activeLeadingBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;
    Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
    Color leadingIconColor = isLight ? LightColors.primary : DarkColors.primary;

    // =========== Text Styles =============
    TextStyle titleStyle = AppTextStyles.medium12;
    TextStyle subTitleStyle = AppTextStyles.regular10;
    TextStyle tralingStyle = AppTextStyles.medium10;

    int selectedSetting = ref.watch(selectedSettingPartIndexProvider);
    bool isActive = selectedSetting == index;

    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: isActive ? leadingBgColor : activeLeadingBgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onTap: () {
          ref.read(selectedSettingPartIndexProvider.notifier).state = index;
        },
        dense: true,
        visualDensity: VisualDensity.compact,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        leading: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: isActive ? activeLeadingBgColor : leadingBgColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(
            Icons.mobile_screen_share_rounded,
            size: 16,
            color: leadingIconColor,
          ),
        ),
        title: Text('Programmany tazelemek', style: titleStyle),
        subtitle: Text('Version 2.14.0', style: subTitleStyle),
        trailing: Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: leadingBgColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('New Version', style: tralingStyle),
              SizedBox(width: 5),
              Icon(Icons.replay, size: 16, color: iconColor),
            ],
          ),
        ),
      ),
    );
  }
}
