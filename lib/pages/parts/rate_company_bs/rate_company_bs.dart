import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/snackbars.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/rate_company.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/bottom_sheet_title.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';
import 'package:kerwenli_yol/providers/api/company.dart';
import 'package:kerwenli_yol/providers/database/user.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class RateCompanyBs extends ConsumerStatefulWidget {
  const RateCompanyBs({super.key, required this.companyId});

  final String companyId;

  @override
  ConsumerState<RateCompanyBs> createState() => _RateCompanyBsState();
}

class _RateCompanyBsState extends ConsumerState<RateCompanyBs> {
  int selectedRating = 0;
  bool sending = false;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations lang = AppLocalizations.of(context)!;
    final bool isLight = isLightTheme(context, ref);
    final Color starColor = isLight ? LightColors.vipCard : DarkColors.vipCard;
    final Color inactiveStarColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;

    return BottomSheetWidget(
      children: [
        BottomSheetTitle(text: lang.rateCompany),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            final int starValue = index + 1;
            final bool isSelected = starValue <= selectedRating;

            return IconButton(
              onPressed: () => setState(() => selectedRating = starValue),
              icon: Icon(
                isSelected ? Icons.star : Icons.star_border,
                color: isSelected ? starColor : inactiveStarColor,
                size: 32,
              ),
            );
          }),
        ),
        SizedBox(height: 10),
        PrimaryButton(
          text: lang.confirm,
          onPressed: () async {
            if (selectedRating == 0 || sending) return;

            setState(() => sending = true);

            final String userId = await ref.read(getUserIdProvider.future);

            try {
              final bool result = await ref.read(
                rateCompanyProvider(
                  RateCompanyModel(
                    companyId: widget.companyId,
                    userId: userId,
                    rating: selectedRating.toDouble(),
                  ),
                ).future,
              );

              if (!context.mounted) return;

              if (result) {
                ref.invalidate(fetchCompanyProvider(widget.companyId));
                Navigator.pop(context);
              } else {
                showErrorSnackbar(context, lang.somethingWentWrong);
              }
            } catch (_) {
              if (context.mounted) {
                showErrorSnackbar(context, lang.somethingWentWrong);
              }
            } finally {
              if (mounted) setState(() => sending = false);
            }
          },
        ),
      ],
    );
  }
}
