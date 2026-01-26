import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/inputs/phone_input.dart';

class MessageBsWithPhone extends StatelessWidget {
  const MessageBsWithPhone({
    super.key,
    required this.formKey,
    required this.phoneCtrl,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phoneCtrl;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [PhoneInput(ctrl: phoneCtrl)],
          ),
          // SizedBox(height: 16),
          // LoginButton(
          //   passwordCtrl: passwordCtrl,
          //   phoneCtrl: phoneCtrl,
          //   formKeyForPhone: formKey,
          // ),
        ],
      ),
    );
  }
}
