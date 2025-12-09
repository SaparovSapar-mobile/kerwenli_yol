import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/pages/check_otp_page/check_otp_page.dart';
import 'package:kerwenli_yol/pages/parts/inputs/confirm_password_input.dart';
import 'package:kerwenli_yol/pages/parts/inputs/email_input.dart';
import 'package:kerwenli_yol/pages/parts/inputs/name_input.dart';
import 'package:kerwenli_yol/pages/parts/inputs/password_input.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';
import 'package:kerwenli_yol/pages/register_page/parts/confirm_privacy_policy_button.dart';

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
    return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
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
                SizedBox(height: 30),
                ConfirmPrivacyPolicyButton(),
              ],
            ),
          ),
          SizedBox(height: 16),
          PrimaryButton(
            text: 'Kod ugratmak',
            onPressed: () => goToPage(
              context,
              CheckOtpPage(text: 'Emailiňize gelen kody giriziň'),
              AxisDirection.left,
            ),
          ),
        ],
      ),
    );
  }
}
