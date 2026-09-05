import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/enums/contact_type.dart';
import 'package:kerwenli_yol/helpers/methods/snackbars.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/send_msg_to_company.dart';
import 'package:kerwenli_yol/pages/check_otp_page/parts/widget.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';
import 'package:kerwenli_yol/providers/api/company.dart';
import 'package:kerwenli_yol/providers/pages/companies_page.dart';

class SendMessageBsButton extends ConsumerWidget {
  const SendMessageBsButton({
    super.key,
    this.formKeyForPhone,
    this.formKeyForEmail,
    this.emailCtrl,
    this.phoneCtrl,
    required this.messageCtrl,
    required this.companyId,
  });

  final TextEditingController? emailCtrl, phoneCtrl;
  final TextEditingController messageCtrl;
  final GlobalKey<FormState>? formKeyForPhone, formKeyForEmail;
  final String companyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    return PrimaryButton(
      text: 'Ugratmak',
      btnPressProvider: sendMsgBtnPressProvider,
      onPressed: () async {
        final GlobalKey<FormState> formKey = emailCtrl != null
            ? formKeyForEmail!
            : formKeyForPhone!;

        if (formKey.currentState?.validate() == false) {
          showErrorSnackbar(
            context,
            lang.pleaseEnterTheInformationCompletelyAndCorrectly,
          );
          return;
        }

        ref.read(sendMsgBtnPressProvider.notifier).state = true;

        final String ct = emailCtrl != null
            ? ContactType.email
            : ContactType.phone;
        final String email = emailCtrl == null ? '' : emailCtrl!.text;
        // на сервер уходит полный номер с кодом страны
        final String phone = phoneCtrl == null || phoneCtrl!.text.isEmpty
            ? ''
            : formatLogin(phoneCtrl!.text);
        final String sc = email != '' ? email : phone;

        final SendMsgToCompanyModel reqData = SendMsgToCompanyModel(
          companyId: companyId,
          contactType: ct,
          senderContact: sc,
          text: messageCtrl.text,
        );

        final bool respUser = await ref.read(
          sendMessageToCompanyProvider(reqData).future,
        );
        if (!respUser) {
          if (context.mounted) {
            showErrorSnackbar(context, lang.somethingWentWrong);
            ref.read(sendMsgBtnPressProvider.notifier).state = false;
          }
          return;
        }

        if (context.mounted) {
          showSuccessSnackbar(context, 'Hatynyz ustunlikli ugradyldy');
          ref.read(sendMsgBtnPressProvider.notifier).state = false;

          Navigator.pop(context);
          Navigator.pop(context);
        }
      },
    );
  }
}
