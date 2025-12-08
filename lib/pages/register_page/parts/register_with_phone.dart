import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/inputs/name_input.dart';

class RegisterWithPhone extends StatelessWidget {
  const RegisterWithPhone({
    super.key,
    required this.formKey,
    required this.nameCtrl,
    required this.phoneCtr,
    required this.passwordCtrl,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameCtrl, phoneCtr, passwordCtrl;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: 16),
          NameInput(ctrl: nameCtrl),
        ],
      ),
    );
  }
}
