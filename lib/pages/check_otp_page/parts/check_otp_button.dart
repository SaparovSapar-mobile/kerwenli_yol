import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/pages/bottom_navigation_page.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';
import 'package:kerwenli_yol/providers/parts/inputs.dart';

class CheckOtpButton extends ConsumerWidget {
  const CheckOtpButton({
    super.key,
    required this.email,
    required this.phone,
    required this.password,
  });

  final String email, phone, password;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrimaryButton(
      text: 'Tassykalamk',
      onPressed: () async {
        ref.read(checkOTPCodeBtnPressProvider.notifier).state = true;

        // goToPage(context, BottomNavigationPage(), AxisDirection.left);
      },
    );
  }
}
