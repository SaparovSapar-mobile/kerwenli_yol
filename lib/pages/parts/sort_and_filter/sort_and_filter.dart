import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/pages/bottom_sheets.dart';
import 'package:kerwenli_yol/pages/parts/sort_and_filter/parts/sort_or_filter_button.dart';

class SortAndFilter extends StatelessWidget {
  const SortAndFilter({super.key, required this.gridOrListProvider});

  final StateProvider<int> gridOrListProvider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SortOrFilterButton(
          text: 'Tertiple',
          onTap: () => showSortBottomSheet(context, gridOrListProvider),
        ),
        SizedBox(width: 15),
        SortOrFilterButton(
          text: 'Filter',
          onTap: () => showFilterBottomSheet(context),
        ),
      ],
    );
  }
}
