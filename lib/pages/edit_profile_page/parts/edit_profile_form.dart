import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/edit_profile_page/parts/save_profile_button.dart';
import 'package:kerwenli_yol/pages/forgot_password_page/forgot_password_page.dart';
import 'package:kerwenli_yol/pages/parts/bg_page_light_button.dart';
import 'package:kerwenli_yol/pages/parts/inputs/name_input.dart';

class EditProfileForm extends ConsumerWidget {
  const EditProfileForm({
    super.key,
    required this.formKey,
    required this.nameCtrl,
    required this.contactInput,
    required this.formBgColor,
    required this.userId,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameCtrl;

  /// телефон или e-mail - показывается только для чтения
  final Widget contactInput;
  final Color formBgColor;
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
              decoration: BoxDecoration(
                color: formBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  NameInput(ctrl: nameCtrl),
                  contactInput,
                  const SizedBox(height: 6),
                  // вместо полей пароля - переход на восстановление пароля
                  BgPageLightButton(
                    text: lang.forgotPassword,
                    onPressed: () => goToPage(
                      context,
                      const ForgotPasswordPage(),
                      AxisDirection.left,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SaveProfileButton(
              formKey: formKey,
              nameCtrl: nameCtrl,
              userId: userId,
            ),
          ],
        ),
      ),
    );
  }
}
