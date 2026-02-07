import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/bottom_sheet_title.dart';
import 'package:kerwenli_yol/pages/parts/sort_bottom_sheet/parts/filter_button.dart';
import 'package:kerwenli_yol/pages/parts/sort_bottom_sheet/parts/sort_list_tile.dart';
import 'package:kerwenli_yol/pages/parts/sort_bottom_sheet/parts/sort_list_tile_with_icon.dart';
import 'package:kerwenli_yol/providers/pages/companies_page.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({super.key, required this.gridOrListProvider});

  final StateProvider<int> gridOrListProvider;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = AppTextStyles.semiBold14;

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
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.centerLeft,
          child: Text('Görnüşi', style: textStyle, textAlign: TextAlign.left),
        ),
        SortListTileWithIcon(
          title: 'Grid',
          value: 0,
          sortOrFilterProvider: gridOrListProvider,
          icon: Icons.window,
        ),
        SortListTileWithIcon(
          title: 'List',
          value: 1,
          sortOrFilterProvider: gridOrListProvider,
          icon: Icons.align_horizontal_left,
        ),
        SizedBox(height: 16),
        FilterButton(),
      ],
    );
  }
}
