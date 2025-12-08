import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/inputs/input_part/input_part.dart';
import 'package:kerwenli_yol/providers/parts/inputs.dart';

class NameInput extends StatelessWidget {
  const NameInput({super.key, required this.ctrl});

  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    return InputPart(
      labelText: 'Ady',
      ctrl: ctrl,
      showClearInputProvider: clearNameProvider,
    );
  }
}
