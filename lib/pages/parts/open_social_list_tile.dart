import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class OpenSocialListTile extends ConsumerWidget {
  const OpenSocialListTile({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final String icon, text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;

    TextStyle textStyle = AppTextStyles.regular10;

    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      dense: true,
      visualDensity: VisualDensity.compact,
      leading: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Image.asset(
          'assets/images/$icon',
          width: 16,
          height: 16,
          color: iconColor,
        ),
      ),
      title: Text(text, style: textStyle),
      trailing: Icon(Icons.arrow_outward, size: 16, color: iconColor),
    );
  }
}
