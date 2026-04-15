import 'package:flutter/material.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/parts/inputs/input_part/input_part.dart';
import 'package:kerwenli_yol/providers/parts/inputs.dart';

class PhoneInput extends StatelessWidget {
  const PhoneInput({super.key, required this.ctrl, this.readOnly});

  final TextEditingController ctrl;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    return InputPart(
      labelText: lang.phoneNumber,
      ctrl: ctrl,
      keyboardType: TextInputType.phone,
      prefixText: '+993 | ',
      showClearInputProvider: clearPhoneProvider,
      readOnly: readOnly,
      validationFunc: (value) {
        if (value == null || value.length < 8) {
          return '';
        }
        return null;
      },
    );
  }
}
