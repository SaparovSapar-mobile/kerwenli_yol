import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/snackbars.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/user.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';
import 'package:kerwenli_yol/providers/api/faq.dart';
import 'package:kerwenli_yol/providers/database/user.dart';
import 'package:kerwenli_yol/providers/parts/inputs.dart';

/// Кнопка отправки письма в Täjir Trade.
///
/// Уходит через POST /client/faqs/{uuid}/requests - это единственный
/// канал "клиент -> админ" на бэкенде: админ видит обращение в своём
/// разделе и может на него ответить.
class SendWriteMessageButton extends ConsumerWidget {
  const SendWriteMessageButton({
    super.key,
    required this.formKey,
    required this.contactCtrl,
    required this.messageCtrl,
    required this.isPhone,
  });

  final GlobalKey<FormState> formKey;

  /// телефон или e-mail отправителя
  final TextEditingController contactCtrl;
  final TextEditingController messageCtrl;

  /// true - вкладка телефона, false - вкладка e-mail
  final bool isPhone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    return PrimaryButton(
      text: 'Ugratmak',
      btnPressProvider: sendMessageBtnPressProvider,
      onPressed: () async {
        if (formKey.currentState?.validate() == false) {
          showErrorSnackbar(
            context,
            lang.pleaseEnterTheInformationCompletelyAndCorrectly,
          );
          return;
        }

        final String text = messageCtrl.text.trim();
        if (text.isEmpty) return;

        ref.read(sendMessageBtnPressProvider.notifier).state = true;

        // к какому пункту FAQ прикрепить обращение
        final String faqUuid = await ref.read(supportFaqUuidProvider.future);
        if (faqUuid.isEmpty) {
          ref.read(sendMessageBtnPressProvider.notifier).state = false;
          if (context.mounted) {
            showErrorSnackbar(context, lang.somethingWentWrong);
          }
          return;
        }

        final UserModel user = await ref.read(getUserProvider.future);

        // в схеме обращения телефона нет, только name/email/description,
        // поэтому номер дописываем в текст, чтобы админ видел контакт
        final String contact = isPhone
            ? '+993${contactCtrl.text.trim()}'
            : contactCtrl.text.trim();
        final String description = '$text\n\n$contact';

        // бэкенд отвечает "missing param", если хоть одно из трёх полей
        // пустое. У пользователя может не быть ни имени, ни почты
        // (регистрация по телефону), поэтому подставляем контакт.
        final String name = user.name.trim().isNotEmpty
            ? user.name.trim()
            : contact;
        final String email = user.email.trim().isNotEmpty
            ? user.email.trim()
            : contact;

        final bool result = await ref
            .read(faqApiProvider)
            .sendFaqRequest(
              faqUuid: faqUuid,
              name: name,
              email: email,
              description: description,
            );

        ref.read(sendMessageBtnPressProvider.notifier).state = false;

        if (!context.mounted) return;

        if (!result) {
          showErrorSnackbar(context, lang.somethingWentWrong);
          return;
        }

        showSuccessSnackbar(context, 'Hatynyz ustunlikli ugradyldy');
        messageCtrl.clear();
        Navigator.pop(context);
      },
    );
  }
}
