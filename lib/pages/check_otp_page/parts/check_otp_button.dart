import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/database/functions/user.dart';
import 'package:kerwenli_yol/helpers/methods/snackbars.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/check_otp.dart';
import 'package:kerwenli_yol/models/login_user.dart';
import 'package:kerwenli_yol/models/user.dart';
import 'package:kerwenli_yol/pages/bottom_navigation_page.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';
import 'package:kerwenli_yol/providers/api/user.dart';
import 'package:kerwenli_yol/providers/database/user.dart';
import 'package:kerwenli_yol/providers/parts/inputs.dart';
import 'package:kerwenli_yol/providers/settings.dart';

class CheckOtpButton extends ConsumerWidget {
  const CheckOtpButton({
    super.key,
    required this.email,
    required this.phone,
    required this.password,
    required this.forRegister,
  });

  final String email, phone, password;
  final bool forRegister;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppLocalizations lang = AppLocalizations.of(context)!;

    return PrimaryButton(
      text: 'Tassykalamk',
      btnPressProvider: checkOTPCodeBtnPressProvider,
      onPressed: () async {
        ref.read(checkOTPCodeBtnPressProvider.notifier).state = true;

        String otpCode = ref.read(otpCodeProvider);

        // ======== Check otp code ==============
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

        // ======== Login User ==========
        String login = email;
        if (email == '') {
          login = phone;
        }
        LoginUserModel reqDataLogin = LoginUserModel(
          login: login,
          password: password,
        );
        UserModel respUser = await ref.read(
          loginUserProvider(reqDataLogin).future,
        );
        if (respUser.id == '' && respUser.token == '') {
          if (context.mounted) {
            showErrorSnackbar(context, lang.somethingWentWrong);
            ref.read(checkOTPCodeBtnPressProvider.notifier).state = false;
          }
          return;
        }

        // ====== insert user to db ===========
        await createUser(
          UserModel(
            id: respUser.id,
            email: respUser.email,
            name: respUser.name,
            phone: respUser.phone,
            image: respUser.image,
            token: respUser.token,
          ),
        );

        ref.read(checkOTPCodeBtnPressProvider.notifier).state = false;
        ref.invalidate(getUserProvider);

        // ==== Ulanyjy programmany ilkinji gezek acyan bolsa==
        bool isFirstTime = ref.read(isFirstTimeProvider);
        if (isFirstTime) {
          ref.read(isFirstTimeProvider.notifier).update(false);
        }

        // ==== Ulanyjy programmany ilkinji gezek acyan bolsa==
        if (context.mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavigationPage(),
            ),
            (Route<dynamic> route) => false,
          );
        }
      },
    );
  }
}
