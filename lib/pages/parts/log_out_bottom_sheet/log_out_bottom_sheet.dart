import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/log_out_bottom_sheet/parts/log_out_button.dart';
import 'package:kerwenli_yol/pages/parts/silver_border_button.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class LogOutBottomSheet extends ConsumerWidget {
  const LogOutBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    // ======== Colors ==========
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;
    final Color iconColor = isLight ? LightColors.primary : DarkColors.primary;
    final Color textColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    // ======== Text Styles ==========
    final TextStyle ts = AppTextStyles.semiBold16.copyWith(color: textColor);

    return BottomSheetWidget(
      children: [
        CircleAvatar(
          backgroundColor: bgColor,
          radius: 18,
          child: Icon(Icons.info, size: 20, color: iconColor),
        ),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 16),
          child: Text(
            lang.areYouSureYouWantLogOut,
            textAlign: TextAlign.center,
            style: ts,
          ),
        ),
        LogOutButton(),
        SizedBox(height: 8),
        SilverBorderButton(
          text: lang.no,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
