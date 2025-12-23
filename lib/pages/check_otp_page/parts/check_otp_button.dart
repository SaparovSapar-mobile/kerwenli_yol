import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/methods/snackbars.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/check_otp.dart';
import 'package:kerwenli_yol/pages/bottom_navigation_page.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';
import 'package:kerwenli_yol/providers/api/user.dart';
import 'package:kerwenli_yol/providers/parts/inputs.dart';

class CheckOtpButton extends ConsumerWidget {
  const CheckOtpButton({
    super.key,
    required this.email,
    required this.phone,
    required this.password,
  });

  final String email, phone, password;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppLocalizations lang = AppLocalizations.of(context)!;

    return PrimaryButton(
      text: 'Tassykalamk',
      onPressed: () async {
        ref.read(checkOTPCodeBtnPressProvider.notifier).state = true;

        String otpCode = ref.read(otpCodeProvider);

        CheckOtpModel reqData = CheckOtpModel(
          email: email,
          phone: phone,
          otpCode: otpCode,
        );

        if (!await ref.read(verifyEmailProvider(reqData).future)) {
          if (context.mounted) {
            showErrorSnackbar(context, lang.somethingWentWrong);
            ref.read(checkOTPCodeBtnPressProvider.notifier).state = false;
          }
          return;
        }

        // goToPage(context, BottomNavigationPage(), AxisDirection.left);
      },
    );
  }
}
