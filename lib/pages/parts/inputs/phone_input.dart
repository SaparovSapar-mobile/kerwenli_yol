import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/inputs/input_part/input_part.dart';

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
    );
  }
}
