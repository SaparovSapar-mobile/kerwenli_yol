import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/inputs/email_input.dart';
import 'package:kerwenli_yol/pages/parts/inputs/message_input.dart';
import 'package:kerwenli_yol/pages/parts/message_bs/parts/send_message_bs_button.dart';

class MessageBsWithEmail extends StatelessWidget {
  const MessageBsWithEmail({
    super.key,
    required this.formKey,
    required this.emailCtrl,
    required this.messageCtrl,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailCtrl, messageCtrl;

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
                child: EmailInput(ctrl: emailCtrl, readOnly: true),
              ),
              MessageInput(ctrl: messageCtrl),
            ],
          ),
          SizedBox(height: 16),
          SendMessageBsButton(
            messageCtrl: messageCtrl,
            formKeyForEmail: formKey,
            emailCtrl: emailCtrl,
          ),
        ],
      ),
    );
  }
}
