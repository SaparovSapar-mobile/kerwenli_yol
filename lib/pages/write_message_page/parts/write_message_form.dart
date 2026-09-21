import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/pages/parts/inputs/message_input.dart';
import 'package:kerwenli_yol/pages/write_message_page/parts/send_write_message_button.dart';

class WriteMessageForm extends ConsumerWidget {
  const WriteMessageForm({
    super.key,
    required this.formKey,
    required this.contactInput,
    required this.contactCtrl,
    required this.messageCtrl,
    required this.isPhone,
  });

  final GlobalKey<FormState> formKey;

  /// поле телефона или e-mail - только для чтения, берётся из профиля
  final Widget contactInput;
  final TextEditingController contactCtrl, messageCtrl;

  /// true - вкладка телефона, false - вкладка e-mail
  final bool isPhone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // плавающий label поля рисуется выше его рамки, без этого
            // отступа SingleChildScrollView обрезает ему верхушку
            const SizedBox(height: 10),
            contactInput,
            MessageInput(ctrl: messageCtrl),
            const SizedBox(height: 16),
            SendWriteMessageButton(
              formKey: formKey,
              contactCtrl: contactCtrl,
              messageCtrl: messageCtrl,
              isPhone: isPhone,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
