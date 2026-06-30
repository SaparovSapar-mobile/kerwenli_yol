import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/database/functions/user.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/methods/snackbars.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/check_otp.dart';
import 'package:kerwenli_yol/models/login_user.dart';
import 'package:kerwenli_yol/models/register_user.dart';
import 'package:kerwenli_yol/models/update_password.dart';
import 'package:kerwenli_yol/models/user.dart';
import 'package:kerwenli_yol/pages/bottom_navigation_page.dart';
import 'package:kerwenli_yol/pages/login_page/login_page.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';
import 'package:kerwenli_yol/providers/api/user.dart';
import 'package:kerwenli_yol/providers/database/user.dart';
import 'package:kerwenli_yol/providers/parts/inputs.dart';
import 'package:kerwenli_yol/providers/settings.dart';

import 'widget.dart';

class CheckOtpButton extends ConsumerWidget {
  const CheckOtpButton({
    super.key,
    required this.email,
    required this.phone,
    required this.password,
    required this.forRegister,
    required this.otpController,
  });

  final String email, phone, password;
  final bool forRegister;
  final TextEditingController otpController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    return PrimaryButton(
      text: lang.confirm,
      btnPressProvider: checkOTPCodeBtnPressProvider,
      onPressed: () async {
        ref.read(checkOTPCodeBtnPressProvider.notifier).state = true;

        final String otpCode = otpController.text;
        print('=== otpCode: "$otpCode" length: ${otpCode.length}');

        // Определяем длину OTP
        final int otpLength = phone.isNotEmpty ? 4 : 6;

        if (otpCode.length != otpLength) {
          // <-- динамически
          showErrorSnackbar(context, lang.somethingWentWrong);
          ref.read(checkOTPCodeBtnPressProvider.notifier).state = false;
          return;
        }
        print('=== OTP прошёл проверку, идём дальше');

        if (forRegister) {
          bool verified = false;

          if (phone.isNotEmpty) {
            // ✅ телефон → /client/phone/confirm
            verified = await ref.read(
              confirmPhoneOtpProvider(
                ConfirmPhoneOtpParams(phone: formatLogin(phone), code: otpCode),
              ).future,
            );
          } else {
            // ✅ email → /client/verify-email
            final CheckOtpModel reqData = CheckOtpModel(
              email: email,
              phone: '',
              otpCode: otpCode,
            );
            verified = await ref.read(verifyEmailProvider(reqData).future);
          }
          print('=== verifyEmail результат: $verified');

          if (!verified) {
            if (context.mounted) {
              showErrorSnackbar(context, lang.somethingWentWrong);
              ref.read(checkOTPCodeBtnPressProvider.notifier).state = false;
            }
            return;
          }

          // ======== Login User ==========
          String login = email;
          if (email == '') {
            login = formatLogin(phone);
          }
          print('=== вызываем loginUser: login="$login", password="$password"');

          final LoginUserModel reqDataLogin = LoginUserModel(
            login: login,
            password: password,
          );
          final UserModel respUser = await ref.read(
            loginUserProvider(reqDataLogin).future,
          );
          print(
            '=== loginUser response: id="${respUser.id}", token="${respUser.token}"',
          );

          if (respUser.id == '' && respUser.token == '') {
            print('=== loginUser вернул пустые id/token — показываем ошибку');
            if (context.mounted) {
              showErrorSnackbar(context, lang.somethingWentWrong);
              ref.read(checkOTPCodeBtnPressProvider.notifier).state = false;
            }
            return;
          }

          // ====== insert user to db ===========
          print('=== сохраняем пользователя в БД');
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
          final bool isFirstTime = ref.read(isFirstTimeProvider);
          if (isFirstTime) {
            ref.read(isFirstTimeProvider.notifier).update(false);
          }

          print('=== переходим на BottomNavigationPage');
          if (context.mounted) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const BottomNavigationPage(),
              ),
              (Route<dynamic> route) => false,
            );
          }

          return;
        }

        // ======== Update Passoword ucin ==============
        print('=== вызываем updatePassword');
        final UpdatePasswordModel reqData = UpdatePasswordModel(
          code: otpCode,
          newPassword: password,
        );
        final ResultRegister result = await ref.read(
          updatePasswordProvider(reqData).future,
        );
        print(
          '=== updatePassword результат: success=${result.success}, message=${result.message}',
        );

        if (!result.success) {
          if (context.mounted) {
            showErrorSnackbar(context, lang.somethingWentWrong);
            ref.read(checkOTPCodeBtnPressProvider.notifier).state = false;
          }
          return;
        }

        ref.read(checkOTPCodeBtnPressProvider.notifier).state = false;

        if (context.mounted) {
          goToPage(context, LoginPage(), AxisDirection.left);
        }
      },
    );
  }
}
