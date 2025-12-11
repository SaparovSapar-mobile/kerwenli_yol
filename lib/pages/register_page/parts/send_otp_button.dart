import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/pages/check_otp_page/check_otp_page.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';

class SendOtpButton extends StatelessWidget {
  const SendOtpButton({
    super.key,
    this.formKeyForPhone,
    this.formKeyForEmail,
    this.emailCtrl,
    this.phoneCtrl,
    required this.passwordCtrl,
    required this.fullNameCtrl,
    required this.text,
  });

  final TextEditingController? emailCtrl, phoneCtrl;
  final TextEditingController passwordCtrl, fullNameCtrl;
  final GlobalKey<FormState>? formKeyForPhone, formKeyForEmail;
  final String text;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      text: 'Kod ugratmak',
      onPressed: () =>
          goToPage(context, CheckOtpPage(text: text), AxisDirection.left),
    );
  }
}
