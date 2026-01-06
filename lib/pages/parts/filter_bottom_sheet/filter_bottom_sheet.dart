import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/bottom_sheet_title.dart';
import 'package:kerwenli_yol/pages/parts/filter_bottom_sheet/parts/filter_expansion_tile.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      children: [
        BottomSheetTitle(text: 'Filter'),
        FilterExpansionTile(),
        SizedBox(height: 16),
        PrimaryButton(text: 'Filter', onPressed: () => Navigator.pop(context)),
      ],
    );
  }
}
