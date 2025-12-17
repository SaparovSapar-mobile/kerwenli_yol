import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/providers/pages/settings.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class SettingPartCard extends ConsumerWidget {
  const SettingPartCard({
    super.key,
    required this.index,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final int index;
  final String text;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    TextStyle titleStyle = AppTextStyles.medium12;

    int selectedSetting = ref.watch(selectedSettingPartIndexProvider);
    bool isActive = selectedSetting == index;

    return Container(
      decoration: BoxDecoration(
        color: isActive ? leadingBgColor : activeLeadingBgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        dense: true,
        visualDensity: VisualDensity.compact, // ekstra sıkıştırır
        contentPadding: EdgeInsets.symmetric(
          horizontal: 5,
        ), // sağ-sol dış iç boşluk
        minLeadingWidth: 0, // leading alanını küçültür
        horizontalTitleGap: 10, // istersen 0 yap
        minVerticalPadding: 0, // üst-alt iç boşluğu sıfırlar
        onTap: () {
          ref.read(selectedSettingPartIndexProvider.notifier).state = index;
          onTap();
        },
        leading: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: isActive ? activeLeadingBgColor : leadingBgColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(icon, size: 16, color: leadingIconColor),
        ),
        title: Text(text, style: titleStyle),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: iconColor),
      ),
    );
  }
}
