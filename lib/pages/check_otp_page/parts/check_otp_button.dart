import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/pages/bottom_navigation_page.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';

class CheckOtpButton extends StatelessWidget {
  const CheckOtpButton({
    super.key,
    required this.email,
    required this.phone,
    required this.password,
  });

  final String email, phone, password;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      text: 'Tassykalamk',
      onPressed: () =>
          goToPage(context, BottomNavigationPage(), AxisDirection.left),
    );
  }
}
