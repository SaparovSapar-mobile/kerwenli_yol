import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
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
    Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
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

          // // ====== eger switch ulanmak gerek bolsa =======
          // if (settingProvider != null) {
          //   ref.read(settingProvider!.notifier).update(!openSetting);
          // }

          // // ========== eger ontap ulanmak gerek bolsa =======
          // if (onTap != null) {
          //   onTap!();
          // }
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
            inactiveTrackColor: iconColor,
            onChanged: (v) {
              // ref.read(settingProvider!.notifier).update(v);
              ref.read(selectedSettingPartIndexProvider.notifier).state = index;
            },
          ),
        ),
      ),
    );
  }
}
