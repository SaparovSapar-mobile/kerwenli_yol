import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/methods/snackbars.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/register_user.dart';
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
    required this.passwordCtrl,
    required this.fullNameCtrl,
    required this.text,
  });

  final TextEditingController? emailCtrl, phoneCtrl;
  final TextEditingController passwordCtrl, fullNameCtrl;
  final GlobalKey<FormState>? formKeyForPhone, formKeyForEmail;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppLocalizations lang = AppLocalizations.of(context)!;

    return PrimaryButton(
      text: 'Kod ugratmak',
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

        bool confirmPrivacy = ref.read(confirmPrivacyProvider);
        if (!confirmPrivacy) {
          showErrorSnackbar(context, lang.getToKnowTheRules);
          return;
        }

        ref.read(sendOTPCodeBtnPressProvider.notifier).state = true;

        RegisterUserModel reqData = RegisterUserModel(
          email: emailCtrl != null ? emailCtrl!.text : '',
          name: fullNameCtrl.text,
          password: passwordCtrl.text,
          phone: phoneCtrl != null ? phoneCtrl!.text : '',
        );

        ResultRegister result = await ref.read(
          registerUserProvider(reqData).future,
        );

        // ====== check client already exists ============
        if (result.message == 'email already registered' ||
            result.message == 'phone already registered') {
          if (context.mounted) {
            showErrorSnackbar(context, lang.thisUserAlreadyExists);
            ref.read(sendOTPCodeBtnPressProvider.notifier).state = false;
          }
          return;
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
          goToPage(context, CheckOtpPage(text: text), AxisDirection.left);
        }
      },
    );
  }
}
