import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/inputs/message_input.dart';
import 'package:kerwenli_yol/pages/parts/inputs/phone_input.dart';
import 'package:kerwenli_yol/pages/parts/message_bs/parts/send_message_bs_button.dart';

class MessageBsWithPhone extends StatelessWidget {
  const MessageBsWithPhone({
    super.key,
    required this.formKey,
    required this.phoneCtrl,
    required this.messageCtrl,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phoneCtrl, messageCtrl;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: PhoneInput(ctrl: phoneCtrl, readOnly: true),
              ),
              MessageInput(ctrl: messageCtrl),
            ],
          ),
          SizedBox(height: 16),
          SendMessageBsButton(
            messageCtrl: messageCtrl,
            formKeyForPhone: formKey,
            phoneCtrl: phoneCtrl,
          ),
        ],
      ),
    );
  }
}
