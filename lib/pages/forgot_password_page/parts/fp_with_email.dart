import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/inputs/email_input.dart';

class FpWithEmail extends StatelessWidget {
  const FpWithEmail({
    super.key,
    required this.formKey,
    required this.emailCtrl,
    required this.formBgColor,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailCtrl;
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
            child: EmailInput(ctrl: emailCtrl),
          ),
          SizedBox(height: 16),
          // LoginButton(
          //   passwordCtrl: passwordCtrl,
          //   emailCtrl: emailCtrl,
          //   formKeyForEmail: formKey,
          // ),
        ],
      ),
    );
  }
}
