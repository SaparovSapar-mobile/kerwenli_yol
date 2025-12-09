import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/check_otp_page/parts/resend_otp_button.dart';
import 'package:kerwenli_yol/providers/parts/inputs.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';
import 'package:pinput/pinput.dart';

class OtpInput extends ConsumerWidget {
  const OtpInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    Color textColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
    Color borderColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;
    Color focusedBorderColor = isLight
        ? LightColors.primary
        : DarkColors.primary;

    TextStyle textStyle = AppTextStyles.medium16.copyWith(
      fontWeight: FontWeight.bold,
      color: textColor,
    );

    final pinTheme = PinTheme(
      width: 56,
      height: 50,
      textStyle: textStyle,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Pinput(
            length: 4,
            defaultPinTheme: pinTheme,
            focusedPinTheme: pinTheme.copyWith(
              decoration: pinTheme.decoration!.copyWith(
                border: Border.all(color: focusedBorderColor),
              ),
            ),
            onCompleted: (value) {
              if (value != '' || value.length == 6) {
                ref.read(otpCodeProvider.notifier).state = value;
              }
            },
          ),
          ResendOtpButton(onResend: () {}),
        ],
      ),
    );
  }
}
