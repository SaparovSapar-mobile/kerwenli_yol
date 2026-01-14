import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';
import 'package:kerwenli_yol/providers/parts/grid_or_list.dart';

class FilterButton extends ConsumerWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isGridCompanies = ref.watch(isGridCompaniesProvider);

    return PrimaryButton(
      text: 'Tertiple',
      onPressed: () {
        ref.read(isGridCompaniesProvider.notifier).state = !isGridCompanies;
        Navigator.pop(context);
      },
    );
  }
}
