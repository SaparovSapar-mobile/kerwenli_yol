import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/methods/snackbars.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/register_user.dart';
import 'package:kerwenli_yol/models/send_otp.dart';
import 'package:kerwenli_yol/pages/check_otp_page/check_otp_page.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';
import 'package:kerwenli_yol/providers/api/user.dart';
import 'package:kerwenli_yol/providers/pages/register_page.dart';
import 'package:kerwenli_yol/providers/parts/inputs.dart';

class SendOtpButton extends ConsumerWidget {
  const SendOtpButton({
    super.key,
    this.formKeyForPhone,
    this.formKeyForEmail,
    this.emailCtrl,
    this.phoneCtrl,
    this.passwordCtrl,
    this.fullNameCtrl,
    required this.text,
  });

  final TextEditingController? emailCtrl, phoneCtrl, passwordCtrl, fullNameCtrl;
  final GlobalKey<FormState>? formKeyForPhone, formKeyForEmail;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppLocalizations lang = AppLocalizations.of(context)!;

    return PrimaryButton(
      text: 'Kod ugratmak',
      btnPressProvider: sendOTPCodeBtnPressProvider,
      onPressed: () async {
        GlobalKey<FormState> formKey = emailCtrl != null
            ? formKeyForEmail!
            : formKeyForPhone!;

        if (formKey.currentState?.validate() == false) {
          showErrorSnackbar(
            context,
            lang.pleaseEnterTheInformationCompletelyAndCorrectly,
          );
          return;
        }

        String userEmail = emailCtrl != null ? emailCtrl!.text : '';
        String userPhone = phoneCtrl != null ? phoneCtrl!.text : '';
        String userPassword = passwordCtrl == null ? '' : passwordCtrl!.text;
        String fullName = fullNameCtrl == null ? '' : fullNameCtrl!.text;

        // ===== Dine Register - de confirm Privacy Control edilyar ===
        if (userPassword == '' || fullName == '') {
          bool confirmPrivacy = ref.read(confirmPrivacyProvider);
          if (!confirmPrivacy) {
            showErrorSnackbar(context, lang.getToKnowTheRules);
            return;
          }
        }

        ref.read(sendOTPCodeBtnPressProvider.notifier).state = true;

        ResultRegister result = ResultRegister.defaultResult();
        if (userPassword == '' || fullName == '') {
          // ====== Ulanyjy Registr Boljak bolanda su yeri isleyar ===
          RegisterUserModel reqData = RegisterUserModel(
            email: userEmail,
            name: fullName,
            password: userPassword,
            phone: userPhone,
          );

          result = await ref.read(registerUserProvider(reqData).future);

          // ====== check client already exists ============
          if (result.message == 'email already registered' ||
              result.message == 'phone already registered') {
            if (context.mounted) {
              showErrorSnackbar(context, lang.thisUserAlreadyExists);
              ref.read(sendOTPCodeBtnPressProvider.notifier).state = false;
            }
            return;
          }
        } else {
          // ====== Forgot Password ucin ========
          SendOtpModel reqData = SendOtpModel(
            email: userEmail,
            phone: userPhone,
          );

          result = await ref.read(sendOtpProvider(reqData).future);
        }

        // === check has some error ==========
        if (!result.success) {
          if (context.mounted) {
            showErrorSnackbar(context, lang.somethingWentWrong);
            ref.read(sendOTPCodeBtnPressProvider.notifier).state = false;
          }
          return;
        }

        ref.read(sendOTPCodeBtnPressProvider.notifier).state = false;
        FocusManager.instance.primaryFocus?.unfocus();

        if (context.mounted) {
          goToPage(
            context,
            CheckOtpPage(
              text: text,
              email: userEmail,
              phone: userPhone,
              password: userPassword,
            ),
            AxisDirection.left,
          );
        }
      },
    );
  }
}
