import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/snackbars.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/register_user.dart';
import 'package:kerwenli_yol/models/send_otp.dart';
import 'package:kerwenli_yol/pages/check_otp_page/parts/resend_otp_button.dart';
import 'package:kerwenli_yol/providers/api/user.dart';
import 'package:kerwenli_yol/providers/parts/inputs.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';
import 'package:pinput/pinput.dart';

import 'widget.dart';

class OtpInput extends ConsumerStatefulWidget {
  const OtpInput({
    super.key,
    required this.otpController,
    required this.forRegister,
    required this.email,
    required this.phone,
    required this.fullName,
    required this.password,
  });
  final TextEditingController otpController;
  final bool forRegister;
  final String email, phone, fullName, password;

  @override
  ConsumerState<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends ConsumerState<OtpInput> {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations lang = AppLocalizations.of(context)!;
    final bool isLight = isLightTheme(context, ref);
    // Определяем длину OTP
    final int otpLength = widget.phone.isNotEmpty ? 4 : 6;

    // ... все цвета и стили как были ...
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color textColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
    final Color borderColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;
    final Color focusedBorderColor = isLight
        ? LightColors.primary
        : DarkColors.primary;

    // ========= Text Styles ==========
    final TextStyle textStyle = AppTextStyles.medium16.copyWith(
      fontWeight: FontWeight.bold,
      color: textColor,
    );

    final pinTheme = PinTheme(
      width: 40,
      height: 40,
      textStyle: textStyle,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
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
        children: [
          Pinput(
            length: otpLength,
            controller: widget.otpController,
            defaultPinTheme: pinTheme,
            focusedPinTheme: pinTheme.copyWith(
              decoration: pinTheme.decoration!.copyWith(
                border: Border.all(color: focusedBorderColor),
              ),
            ),
            onCompleted: (value) {
              if (value.length == 6) {
                ref.read(otpCodeProvider.notifier).state = value;
              }
            },
          ),
          ResendOtpButton(
            onResend: () async {
              ResultRegister result = ResultRegister.defaultResult();

              if (widget.forRegister) {
                // ====== Ulanyjy Registr Boljak bolanda su yeri isleyar ===
                final RegisterUserModel reqData = RegisterUserModel(
                  name: widget.fullName,
                  password: widget.password,
                  phone: widget.phone,
                );

                result = await ref.read(registerUserProvider(reqData).future);

                // ====== check client already exists ============
                if (result.message == 'email already registered' ||
                    result.message == 'phone already registered') {
                  if (context.mounted) {
                    showErrorSnackbar(context, lang.thisUserAlreadyExists);
                  }
                  return;
                }
              } else {
                // ====== Forgot Password ucin ========
                final String login = widget.email.isNotEmpty
                    ? widget.email
                    : formatLogin(widget.phone);

                final ForgotModel reqData = ForgotModel(login: login);

                result = await ref.read(sendOtpProvider(reqData).future);
              }

              // === check has some error ==========
              if (!result.success) {
                if (context.mounted) {
                  showErrorSnackbar(context, lang.somethingWentWrong);
                }
                return;
              }
            },
          ),
        ],
      ),
    );
  }
}
