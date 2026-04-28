import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/bottom_sheet_title.dart';
import 'package:kerwenli_yol/pages/parts/silver_border_button.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class DeleteAccount extends ConsumerWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    // ======== Colors ==========
    final bool isLight = isLightTheme(context, ref);
    final Color textColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    // ======== Text Styles ==========
    final TextStyle ts = AppTextStyles.regular12.copyWith(color: textColor);

    return BottomSheetWidget(
      children: [
        BottomSheetTitle(text: lang.areYouSureYouWantDeleteYourAccount),
        Padding(
          padding: EdgeInsetsGeometry.only(top: 4, bottom: 24),
          child: Text(
            lang.allYourDataWillAlsoDeleted,
            textAlign: TextAlign.start,
            style: ts,
          ),
        ),
        SilverBorderButton(
          text: lang.deleteAccount,
          onPressed: () {},
          icon: Icons.logout,
        ),
      ],
    );
  }
}
