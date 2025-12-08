import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/functions/validators.dart';
import 'package:kerwenli_yol/pages/parts/inputs/input_part/input_part.dart';
import 'package:kerwenli_yol/providers/parts/inputs.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key, required this.ctrl});

  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    return InputPart(
      labelText: 'Email',
      ctrl: ctrl,
      showClearInputProvider: clearNameProvider,
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
