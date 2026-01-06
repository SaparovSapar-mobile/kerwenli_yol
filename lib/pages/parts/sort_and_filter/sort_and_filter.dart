import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/pages/bottom_sheets.dart';
import 'package:kerwenli_yol/pages/parts/sort_and_filter/parts/sort_or_filter_button.dart';

class SortAndFilter extends StatelessWidget {
  const SortAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SortOrFilterButton(
          text: 'Tertiple',
          onTap: () => showSortBottomSheet(context),
        ),
        SizedBox(width: 15),
        SortOrFilterButton(text: 'Filter', onTap: () {}),
      ],
    );
  }
}
