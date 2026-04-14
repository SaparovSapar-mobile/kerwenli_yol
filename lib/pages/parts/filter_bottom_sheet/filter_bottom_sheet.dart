import 'package:flutter/material.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/bottom_sheet_title.dart';
import 'package:kerwenli_yol/pages/parts/filter_bottom_sheet/parts/filter_expansion_tile.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    return BottomSheetWidget(
      children: [
        BottomSheetTitle(text: lang.filter),
        FilterExpansionTile(),
        SizedBox(height: 16),
        PrimaryButton(
          text: lang.filter,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
