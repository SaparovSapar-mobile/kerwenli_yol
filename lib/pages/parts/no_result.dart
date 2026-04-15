import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class NoResult extends ConsumerWidget {
  const NoResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    // ======= Colors ======
    final bool isLight = isLightTheme(context, ref);
    final Color textColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;

    final TextStyle textStyle = AppTextStyles.bold20.copyWith(color: textColor);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/no_result.png',
            height: 111.92688751220703,
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 20),
            child: Text(lang.noDataAvailable, style: textStyle),
          ),
        ],
      ),
    );
  }
}
