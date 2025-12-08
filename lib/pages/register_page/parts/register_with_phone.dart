import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/inputs/name_input.dart';
import 'package:kerwenli_yol/pages/parts/inputs/password_input.dart';

class RegisterWithPhone extends StatelessWidget {
  const RegisterWithPhone({
    super.key,
    required this.formKey,
    required this.nameCtrl,
    required this.phoneCtr,
    required this.passwordCtrl,
    required this.formBgColor,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameCtrl, phoneCtr, passwordCtrl;
  final Color formBgColor;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: formBgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NameInput(ctrl: nameCtrl),
            PasswordInput(ctrl: passwordCtrl),
          ],
        ),
      ),
    );
  }
}
