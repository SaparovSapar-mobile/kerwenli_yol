import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/functions/validators.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/parts/inputs/input_part/input_part.dart';
import 'package:kerwenli_yol/providers/parts/inputs.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key, required this.ctrl, this.readOnly});

  final TextEditingController ctrl;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    return InputPart(
      labelText: lang.email,
      ctrl: ctrl,
      showClearInputProvider: clearEmailProvider,
      readOnly: readOnly,
      validationFunc: (value) {
        if (value == null || value == '' || !validateEmail(value)) {
          return '';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
    );
  }
}
