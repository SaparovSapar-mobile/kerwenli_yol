import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/database/functions/user.dart';
import 'package:kerwenli_yol/helpers/methods/snackbars.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/user.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';
import 'package:kerwenli_yol/providers/api/profile.dart';
import 'package:kerwenli_yol/providers/database/user.dart';
import 'package:kerwenli_yol/providers/parts/inputs.dart';

class SaveProfileButton extends ConsumerWidget {
  const SaveProfileButton({
    super.key,
    required this.formKey,
    required this.nameCtrl,
    required this.userId,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameCtrl;
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    return PrimaryButton(
      text: lang.save,
      btnPressProvider: saveProfileBtnPressProvider,
      onPressed: () async {
        if (formKey.currentState?.validate() == false) {
          showErrorSnackbar(
            context,
            lang.pleaseEnterTheInformationCompletelyAndCorrectly,
          );
          return;
        }

        final String name = nameCtrl.text.trim();
        if (name.isEmpty || userId.isEmpty) return;

        ref.read(saveProfileBtnPressProvider.notifier).state = true;

        bool result = false;
        try {
          result = await ref
              .read(profileApiProvider)
              .updateProfileName(userUuid: userId, name: name);
        } catch (_) {
          result = false;
        }

        if (!result) {
          if (context.mounted) {
            showErrorSnackbar(context, lang.somethingWentWrong);
          }
          ref.read(saveProfileBtnPressProvider.notifier).state = false;
          return;
        }

        // обновляем имя в локальной базе, чтобы не ждать перезахода
        final UserModel current = await getUser();
        await createUser(
          UserModel(
            id: current.id,
            email: current.email,
            name: name,
            phone: current.phone,
            token: current.token,
            image: current.image,
          ),
        );

        ref.invalidate(getUserProvider);
        ref.read(saveProfileBtnPressProvider.notifier).state = false;

        if (context.mounted) {
          showSuccessSnackbar(context, lang.profileUpdated);
          Navigator.pop(context);
        }
      },
    );
  }
}
