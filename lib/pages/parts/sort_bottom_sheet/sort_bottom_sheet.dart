import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/bottom_sheet_title.dart';
import 'package:kerwenli_yol/pages/parts/sort_bottom_sheet/parts/sort_list_tile.dart';
import 'package:kerwenli_yol/providers/pages/companies_page.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      children: [
        BottomSheetTitle(text: 'Tertiple'),
        SortListTile(
          title: 'Maslahat berilýänler',
          value: 0,
          sortOrFilterProvider: companySortIndexProvider,
        ),
        SortListTile(
          title: 'Iň ýakyn',
          value: 1,
          sortOrFilterProvider: companySortIndexProvider,
        ),
      ],
    );
  }
}
