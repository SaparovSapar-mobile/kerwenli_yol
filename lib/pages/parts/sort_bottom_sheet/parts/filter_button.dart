import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';

class FilterButton extends ConsumerWidget {
  const FilterButton({super.key, required this.isGridProvider});

  final StateProvider<bool> isGridProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isGridCompanies = ref.watch(isGridProvider);

    return PrimaryButton(
      text: 'Tertiple',
      onPressed: () {
        ref.read(isGridProvider.notifier).state = !isGridCompanies;
        Navigator.pop(context);
      },
    );
  }
}
