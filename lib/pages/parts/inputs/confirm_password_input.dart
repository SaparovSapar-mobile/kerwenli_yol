import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/inputs/input_part/input_part.dart';
import 'package:kerwenli_yol/providers/parts/inputs.dart';

class ConfirmPasswordInput extends StatelessWidget {
  const ConfirmPasswordInput({
    super.key,
    required this.ctrl,
    required this.confirmCtrl,
  });

  final TextEditingController ctrl, confirmCtrl;

  @override
  Widget build(BuildContext context) {
    return InputPart(
      labelText: 'Açar sözüňizi tassyklaň',
      ctrl: confirmCtrl,
      showInputProvider: showPassProvider,
      validationFunc: (value) {
        if (value == null || value.length < 3 || value != confirmCtrl.text) {
          return '';
        }
        return null;
      },
    );
  }
}
