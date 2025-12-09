import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/inputs/input_part/input_part.dart';
import 'package:kerwenli_yol/providers/parts/inputs.dart';

class PhoneInput extends StatelessWidget {
  const PhoneInput({super.key, required this.ctrl});

  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    return InputPart(
      labelText: 'Telefon belgiňiz',
      ctrl: ctrl,
      keyboardType: TextInputType.phone,
      prefixText: '+993 | ',
      showClearInputProvider: clearPhoneProvider,
      validationFunc: (value) {
        if (value == null || value.length < 8) {
          return '';
        }
        return null;
      },
    );
  }
}
