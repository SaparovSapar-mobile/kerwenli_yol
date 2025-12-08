import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShowInputButton extends ConsumerWidget {
  const ShowInputButton({
    super.key,
    this.showInputProvider,
    required this.showInput,
  });

  final AutoDisposeStateProvider<bool>? showInputProvider;
  final bool showInput;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(showInputProvider!.notifier).state = !showInput,
      child: Icon(
        showInput ? Icons.visibility : Icons.visibility_off,
        color: const Color(0xff9D9D9D),
      ),
    );
  }
}
