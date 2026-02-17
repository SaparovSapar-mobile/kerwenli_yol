import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class OpenLocationListTile extends ConsumerWidget {
  const OpenLocationListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = isLightTheme(context, ref);
    Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
    Color leadingIconColor = isLight ? LightColors.error : DarkColors.error;
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;

    TextStyle textStyle = AppTextStyles.regular10;

    return ListTile(
      onTap: () {},
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
          'assets/images/map_location.png',
          width: 16,
          height: 16,
          color: leadingIconColor,
        ),
      ),
      title: Text('Geolokasiyany gocur al', style: textStyle),
      trailing: Icon(Icons.arrow_outward, size: 16, color: iconColor),
    );
  }
}
