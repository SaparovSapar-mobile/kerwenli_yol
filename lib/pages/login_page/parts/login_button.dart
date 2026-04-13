import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/database/functions/user.dart';
import 'package:kerwenli_yol/helpers/methods/snackbars.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/login_user.dart';
import 'package:kerwenli_yol/models/user.dart';
import 'package:kerwenli_yol/pages/bottom_navigation_page.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';
import 'package:kerwenli_yol/providers/api/user.dart';
import 'package:kerwenli_yol/providers/database/user.dart';
import 'package:kerwenli_yol/providers/parts/inputs.dart';
import 'package:kerwenli_yol/providers/settings.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({
    super.key,
    this.formKeyForPhone,
    this.formKeyForEmail,
    this.emailCtrl,
    this.phoneCtrl,
    required this.passwordCtrl,
  });

  final TextEditingController? emailCtrl, phoneCtrl;
  final TextEditingController passwordCtrl;
  final GlobalKey<FormState>? formKeyForPhone, formKeyForEmail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    return PrimaryButton(
      text: lang.logIn,
      btnPressProvider: loginBtnPressProvider,
      onPressed: () async {
        final GlobalKey<FormState> formKey = emailCtrl != null
            ? formKeyForEmail!
            : formKeyForPhone!;

        if (formKey.currentState?.validate() == false) {
          showErrorSnackbar(
            context,
            lang.pleaseEnterTheInformationCompletelyAndCorrectly,
          );
          return;
        }

        ref.read(loginBtnPressProvider.notifier).state = true;

        // ======== Login User ==========
        final String email = emailCtrl == null ? '' : emailCtrl!.text;
        final String phone = phoneCtrl == null ? '' : phoneCtrl!.text;
        final String password = passwordCtrl.text;

        String login = email;
        if (email == '') {
          login = phone;
        }
        final LoginUserModel reqDataLogin = LoginUserModel(
          login: login,
          password: password,
        );
        final UserModel respUser = await ref.read(
          loginUserProvider(reqDataLogin).future,
        );
        if (respUser.id == '' && respUser.token == '') {
          if (context.mounted) {
            showErrorSnackbar(context, lang.somethingWentWrong);
            ref.read(loginBtnPressProvider.notifier).state = false;
          }
          return;
        }

        // ====== insert user to db ===========
        // respUser.id: 024da1f8-5fe4-407f-afaf-45cee08d935a
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

        ref.read(loginBtnPressProvider.notifier).state = false;
        ref.invalidate(getUserProvider);
        ref.invalidate(getUserIdProvider);

        // ==== Ulanyjy programmany ilkinji gezek acyan bolsa==
        final bool isFirstTime = ref.read(isFirstTimeProvider);
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
