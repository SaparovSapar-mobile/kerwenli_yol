import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/pages/parts/inputs/input_part/parts/clear_input_button.dart';
import 'package:kerwenli_yol/pages/parts/inputs/input_part/parts/show_input_button.dart';

class InputPart extends ConsumerWidget {
  const InputPart({
    super.key,
    required this.labelText,
    this.maxLength,
    this.maxLines,
    required this.ctrl,
    this.keyboardType,
    this.validationFunc,
    this.showInputProvider,
    this.showClearInputProvider,
    this.readOnly,
  });

  final String labelText;
  final int? maxLength, maxLines;
  final TextEditingController ctrl;
  final TextInputType? keyboardType;
  final String? Function(String?)? validationFunc;
  final AutoDisposeStateProvider<bool>? showInputProvider,
      showClearInputProvider;
  final bool? readOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool showInput = false;
    bool showClearInput = false;

    if (showInputProvider != null) {
      showInput = ref.watch(showInputProvider!);
    }
    if (showClearInputProvider != null) {
      showClearInput = ref.watch(showClearInputProvider!);
    }

    return TextFormField(
      readOnly: readOnly ?? false,
      obscureText: showInputProvider != null ? !showInput : false,
      obscuringCharacter: '*',
      controller: ctrl,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        helperText: '',
        counterText: '',
        labelText: labelText,
        suffixIcon: showInputProvider != null
            ? ShowInputButton(
                showInput: showInput,
                showInputProvider: showInputProvider,
              )
            : showClearInputProvider != null && showClearInput
            ? ClearInputButton(
                ctrl: ctrl,
                showClearInput: showClearInput,
                showClearInputProvider: showClearInputProvider,
              )
            : null,
      ),
      validator: validationFunc,
      onChanged: (value) {
        if (showClearInputProvider != null) {
          if (value != "") {
            ref.read(showClearInputProvider!.notifier).state = true;
          } else {
            ref.read(showClearInputProvider!.notifier).state = false;
          }
        }
      },
    );
  }
}
