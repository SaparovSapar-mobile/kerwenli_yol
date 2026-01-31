import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/providers/pages/settings_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';
import 'package:shared_preferences_riverpod/shared_preferences_riverpod.dart';

class SettingPartCard extends ConsumerWidget {
  const SettingPartCard({
    super.key,
    required this.index,
    required this.text,
    this.tralingText,
    required this.icon,
    this.onTap,
    this.settingProvider,
  });

  final int index;
  final String text;
  final String? tralingText;
  final IconData icon;
  final void Function()? onTap;
  final StateNotifierProvider<PrefNotifier<bool>, bool>? settingProvider;

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
    TextStyle tralingStyle = AppTextStyles.regular12;

    int selectedSetting = ref.watch(selectedSettingPartIndexProvider);
    bool isActive = selectedSetting == index;

    final bool openSetting = settingProvider == null
        ? false
        : ref.watch(settingProvider!);

    return Container(
      decoration: BoxDecoration(
        color: isActive ? leadingBgColor : activeLeadingBgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onTap: () {
          ref.read(selectedSettingPartIndexProvider.notifier).state = index;

          // ====== eger switch ulanmak gerek bolsa =======
          if (settingProvider != null) {
            ref.read(settingProvider!.notifier).update(!openSetting);
          }

          // ========== eger ontap ulanmak gerek bolsa =======
          if (onTap != null) {
            onTap!();
          }
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
          child: Icon(icon, size: 16, color: leadingIconColor),
        ),
        title: Text(text, style: titleStyle),
        trailing: settingProvider != null
            ? Transform.scale(
                alignment: Alignment.centerRight,
                scale: 0.6,
                child: Switch(
                  value: openSetting,
                  activeColor: activeLeadingBgColor,
                  activeTrackColor: leadingIconColor,
                  inactiveThumbColor: activeLeadingBgColor,
                  inactiveTrackColor: iconColor,
                  onChanged: (v) {
                    ref.read(settingProvider!.notifier).update(v);
                    ref.read(selectedSettingPartIndexProvider.notifier).state =
                        index;
                  },
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  tralingText != null
                      ? Text(tralingText!, style: tralingStyle)
                      : SizedBox.fromSize(),
                  SizedBox(width: tralingText != null ? 5 : 0),
                  Icon(Icons.arrow_forward_ios, size: 16, color: iconColor),
                ],
              ),
      ),
    );
  }
}
