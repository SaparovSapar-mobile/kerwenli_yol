import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/passcode_page/passcode_page.dart';
import 'package:kerwenli_yol/providers/pages/settings_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class SettingPasscodeButton extends ConsumerWidget {
  const SettingPasscodeButton({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========== Colors ============
    bool isLight = isLightTheme(context, ref);
    Color leadingBgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    Color activeLeadingBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;
    Color inactiveTrackColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.bgPageDark;
    Color leadingIconColor = isLight ? LightColors.primary : DarkColors.primary;

    // ========== Text Styles ============
    TextStyle titleStyle = AppTextStyles.medium12;

    int selectedSetting = ref.watch(selectedSettingPartIndexProvider);
    bool isActive = selectedSetting == index;

    int passCode = ref.watch(passCodeProvider);
    bool openPassCode = passCode != 0;

    return Container(
      decoration: BoxDecoration(
        color: isActive ? leadingBgColor : activeLeadingBgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onTap: () {
          ref.read(selectedSettingPartIndexProvider.notifier).state = index;

          if (openPassCode) {
            ref.read(passCodeProvider.notifier).update(0);
            return;
          }

          goToPage(context, PasscodePage(), AxisDirection.left);
        },
        dense: true,
        visualDensity: VisualDensity.compact,
        contentPadding: const EdgeInsets.only(left: 5),
        leading: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: isActive ? activeLeadingBgColor : leadingBgColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(Icons.lock, size: 16, color: leadingIconColor),
        ),
        title: Text('Pin kod', style: titleStyle),
        trailing: Transform.scale(
          alignment: Alignment.centerRight,
          scale: 0.6,
          child: Switch(
            value: openPassCode,
            activeColor: activeLeadingBgColor,
            activeTrackColor: leadingIconColor,
            inactiveThumbColor: activeLeadingBgColor,
            inactiveTrackColor: inactiveTrackColor,
            onChanged: (v) {
              ref.read(selectedSettingPartIndexProvider.notifier).state = index;

              if (openPassCode) {
                ref.read(passCodeProvider.notifier).update(0);
                return;
              }

              goToPage(context, PasscodePage(), AxisDirection.left);
            },
          ),
        ),
      ),
    );
  }
}
