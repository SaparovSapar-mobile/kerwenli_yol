import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/providers/pages/register_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class ConfirmPrivacyPolicyButton extends ConsumerWidget {
  const ConfirmPrivacyPolicyButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    final bool isLight = isLightTheme(context, ref);
    final Color activeColor = isLight
        ? LightColors.primary
        : DarkColors.primary;
    final Color textColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    final TextStyle textStyle = AppTextStyles.medium14.copyWith(
      decoration: TextDecoration.underline,
      fontStyle: FontStyle.italic,
      color: textColor,
    );

    final bool confirmPrivacy = ref.watch(confirmPrivacyProvider);

    return Row(
      children: [
        Checkbox(
          activeColor: activeColor,
          value: confirmPrivacy,
          onChanged: (value) {
            if (value != null) {
              ref.read(confirmPrivacyProvider.notifier).state = value;
            }
          },
        ),
        SizedBox(width: 4),
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.only(left: 0)),
          onPressed: () {},
          child: Text(lang.iHaveReadTheRules, style: textStyle),
        ),
      ],
    );
  }
}
