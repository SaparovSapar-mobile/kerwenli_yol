import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/bottom_sheet_title.dart';
import 'package:kerwenli_yol/pages/parts/sort_bottom_sheet/parts/sort_list_tile.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      children: [
        BottomSheetTitle(text: 'Tertiple'),
        const SortListTile(title: 'Maslahat berilýänler', value: 0),
        const SortListTile(title: 'Iň ýakyn', value: 1),
      ],
    );
  }
}
