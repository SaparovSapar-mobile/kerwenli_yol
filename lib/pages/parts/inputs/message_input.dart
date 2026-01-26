import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/inputs/input_part/input_part.dart';
import 'package:kerwenli_yol/providers/parts/inputs.dart';

class MessageInput extends StatelessWidget {
  const MessageInput({super.key, required this.ctrl});

  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    return InputPart(
      labelText: 'Hat Yazmak',
      ctrl: ctrl,
      showClearInputProvider: clearNameProvider,
      maxLines: 5,
      validationFunc: (value) {
        if (value == null || value.length < 3) {
          return '';
        }
        return null;
      },
    );
  }
}
