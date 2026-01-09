import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/inputs/email_input.dart';
import 'package:kerwenli_yol/pages/parts/inputs/password_input.dart';
import 'package:kerwenli_yol/pages/register_page/parts/send_otp_button.dart';

class FpWithEmail extends StatelessWidget {
  const FpWithEmail({
    super.key,
    required this.formKey,
    required this.emailCtrl,
    required this.passwordCtrl,
    required this.formBgColor,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailCtrl, passwordCtrl;
  final Color formBgColor;

  @override
  Widget build(BuildContext context) {
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
                EmailInput(ctrl: emailCtrl),
                PasswordInput(ctrl: passwordCtrl),
              ],
            ),
          ),
          SizedBox(height: 16),
          SendOtpButton(
            emailCtrl: emailCtrl,
            formKeyForPhone: formKey,
            text: 'Telefon belgiňize gelen kody giriziň',
            passwordCtrl: passwordCtrl,
          ),
        ],
      ),
    );
  }
}
