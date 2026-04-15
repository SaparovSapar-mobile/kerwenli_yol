import 'package:flutter/material.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/parts/inputs/input_part/input_part.dart';
import 'package:kerwenli_yol/providers/parts/inputs.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key, required this.ctrl});

  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    return InputPart(
      labelText: lang.password,
      ctrl: ctrl,
      showInputProvider: showPassProvider,
      validationFunc: (value) {
        if (value == null || value.length < 3) {
          return '';
        }
        return null;
      },
    );
  }
}
