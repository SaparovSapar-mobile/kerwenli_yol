import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';

class SendMessageBsButton extends ConsumerWidget {
  const SendMessageBsButton({
    super.key,
    this.formKeyForPhone,
    this.formKeyForEmail,
    this.emailCtrl,
    this.phoneCtrl,
    required this.messageCtrl,
  });

  final TextEditingController? emailCtrl, phoneCtrl;
  final TextEditingController messageCtrl;
  final GlobalKey<FormState>? formKeyForPhone, formKeyForEmail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrimaryButton(text: 'Ugratmak', onPressed: () async {});
  }
}
