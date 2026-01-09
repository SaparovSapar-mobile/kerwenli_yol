import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/login_page/parts/login_button.dart';
import 'package:kerwenli_yol/pages/login_page/parts/login_forgot_password_button.dart';
import 'package:kerwenli_yol/pages/parts/bg_page_light_button.dart';
import 'package:kerwenli_yol/pages/parts/inputs/password_input.dart';
import 'package:kerwenli_yol/pages/parts/inputs/phone_input.dart';
import 'package:kerwenli_yol/pages/register_page/register_page.dart';

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
                LoginForgotPasswordButton(),
              ],
            ),
          ),
          SizedBox(height: 16),
          LoginButton(
            passwordCtrl: passwordCtrl,
            phoneCtrl: phoneCtrl,
            formKeyForPhone: formKey,
          ),
          SizedBox(height: 10),
          BgPageLightButton(
            text: 'Agza Bolmak',
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const RegisterPage()),
            ),
          ),
        ],
      ),
    );
  }
}
