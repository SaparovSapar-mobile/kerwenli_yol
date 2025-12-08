import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputPart extends ConsumerWidget {
  const InputPart({
    super.key,
    required this.hintText,
    this.maxLength,
    this.maxLines,
    required this.ctrl,
    this.keyboardType,
    this.validationFunc,
    this.showInputProvider,
    this.readOnly,
  });

  final String hintText;
  final int? maxLength, maxLines;
  final TextEditingController ctrl;
  final TextInputType? keyboardType;
  final String? Function(String?)? validationFunc;
  final AutoDisposeStateProvider<bool>? showInputProvider;
  final bool? readOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool showInput = false;

    if (showInputProvider != null) {
      showInput = ref.watch(showInputProvider!);
    }

    return TextFormField(
      readOnly: readOnly ?? false,
      obscureText: showInputProvider != null ? !showInput : false,
      controller: ctrl,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        helperText: '',
        counterText: '',
        hintText: hintText,
        suffixIcon: showInputProvider != null
            ? GestureDetector(
                onTap: () =>
                    ref.read(showInputProvider!.notifier).state = !showInput,
                child: Icon(
                  showInput ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xff9D9D9D),
                ),
              )
            : null,
      ),
      validator: validationFunc,
    );
  }
}
