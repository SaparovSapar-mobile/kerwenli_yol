import 'package:flutter/material.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/login_page/login_page.dart';
import 'package:kerwenli_yol/pages/parts/bg_page_light_button.dart';
import 'package:kerwenli_yol/pages/parts/inputs/confirm_password_input.dart';
import 'package:kerwenli_yol/pages/parts/inputs/email_input.dart';
import 'package:kerwenli_yol/pages/parts/inputs/name_input.dart';
import 'package:kerwenli_yol/pages/parts/inputs/password_input.dart';
import 'package:kerwenli_yol/pages/register_page/parts/confirm_privacy_policy_button.dart';
import 'package:kerwenli_yol/pages/register_page/parts/send_otp_button.dart';

class RegisterWithEmail extends StatelessWidget {
  const RegisterWithEmail({
    super.key,
    required this.formKey,
    required this.nameCtrl,
    required this.emailCtrl,
    required this.passwordCtrl,
    required this.confirmPasswordCtrl,
    required this.formBgColor,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameCtrl,
      emailCtrl,
      passwordCtrl,
      confirmPasswordCtrl;
  final Color formBgColor;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16, top: 16, right: 16),
            decoration: BoxDecoration(
              color: formBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                NameInput(ctrl: nameCtrl),
                EmailInput(ctrl: emailCtrl),
                PasswordInput(ctrl: passwordCtrl),
                ConfirmPasswordInput(
                  ctrl: passwordCtrl,
                  confirmCtrl: confirmPasswordCtrl,
                ),
                SizedBox(height: 10),
                ConfirmPrivacyPolicyButton(),
              ],
            ),
          ),
          SizedBox(height: 16),
          SendOtpButton(
            passwordCtrl: passwordCtrl,
            fullNameCtrl: nameCtrl,
            emailCtrl: emailCtrl,
            formKeyForEmail: formKey,
            text: 'Emailiňize gelen kody giriziň',
          ),
          SizedBox(height: 10),
          BgPageLightButton(
            text: lang.logIn,
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            ),
          ),
        ],
      ),
    );
  }
}
