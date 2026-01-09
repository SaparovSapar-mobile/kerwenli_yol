import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/login_page/parts/login_forgot_password_button.dart';
import 'package:kerwenli_yol/pages/parts/inputs/password_input.dart';
import 'package:kerwenli_yol/pages/parts/inputs/phone_input.dart';

class LoginWithPhone extends StatelessWidget {
  const LoginWithPhone({
    super.key,
    required this.formKey,
    required this.phoneCtrl,
    required this.passwordCtrl,
    required this.formBgColor,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phoneCtrl, passwordCtrl;
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
                PhoneInput(ctrl: phoneCtrl),
                PasswordInput(ctrl: passwordCtrl),
                SizedBox(height: 10),
                LoginForgotPasswordButton(),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
