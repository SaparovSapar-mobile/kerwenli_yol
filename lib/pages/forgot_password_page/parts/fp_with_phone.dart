import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/inputs/phone_input.dart';
import 'package:kerwenli_yol/pages/register_page/parts/send_otp_button.dart';

class FpWithPhone extends StatelessWidget {
  const FpWithPhone({
    super.key,
    required this.formKey,
    required this.phoneCtrl,
    required this.formBgColor,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phoneCtrl;
  final Color formBgColor;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16, top: 16, right: 16),
            decoration: BoxDecoration(
              color: formBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: PhoneInput(ctrl: phoneCtrl),
          ),
          SizedBox(height: 16),
          SendOtpButton(
            phoneCtrl: phoneCtrl,
            formKeyForPhone: formKey,
            text: 'Telefon belgiňize gelen kody giriziň',
          ),
        ],
      ),
    );
  }
}
