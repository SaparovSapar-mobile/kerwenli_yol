import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class PassLockButton extends ConsumerWidget {
  const PassLockButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    // ======= Colors ========
    final bool isLight = isLightTheme(context, ref);
    final Color btnBgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color btnColor = isLight ? LightColors.primary : DarkColors.primary;

    // ======= Text Styles ========
    final TextStyle titleStyle = AppTextStyles.medium16;
    final TextStyle subTitleStyle = AppTextStyles.regular10;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: btnBgColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(Icons.lock, size: 16, color: btnColor),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(lang.pINCode, style: titleStyle),
        ),
        Text('Kodunyňyzy 2 gezek tassyklaň.', style: subTitleStyle),
      ],
    );
  }
}
