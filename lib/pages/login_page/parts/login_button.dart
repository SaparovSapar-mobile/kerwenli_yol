import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({
    super.key,
    this.formKeyForPhone,
    this.formKeyForEmail,
    this.emailCtrl,
    this.phoneCtrl,
    required this.passwordCtrl,
  });

  final TextEditingController? emailCtrl, phoneCtrl;
  final TextEditingController passwordCtrl;
  final GlobalKey<FormState>? formKeyForPhone, formKeyForEmail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // AppLocalizations lang = AppLocalizations.of(context)!;

    return PrimaryButton(text: 'Ulgama Girmek', onPressed: () async {});
  }
}
