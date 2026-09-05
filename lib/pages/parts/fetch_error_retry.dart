import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class FetchErrorRetry extends ConsumerWidget {
  const FetchErrorRetry({super.key, required this.onRetry});

  final void Function() onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;
    final bool isLight = isLightTheme(context, ref);
    final Color textColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;
    final Color primary = isLight ? LightColors.primary : DarkColors.primary;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.wifi_off_rounded, color: textColor, size: 28),
            const SizedBox(height: 8),
            Text(
              lang.internetConnectionError,
              textAlign: TextAlign.center,
              style: AppTextStyles.regular14.copyWith(color: textColor),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: onRetry,
              child: Text(
                lang.retry,
                style: AppTextStyles.semiBold14.copyWith(color: primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
