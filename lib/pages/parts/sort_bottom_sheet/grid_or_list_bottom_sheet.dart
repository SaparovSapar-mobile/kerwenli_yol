import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/bottom_sheet_title.dart';
import 'package:kerwenli_yol/pages/parts/sort_bottom_sheet/parts/filter_button.dart';
import 'package:kerwenli_yol/pages/parts/sort_bottom_sheet/parts/sort_list_tile_with_icon.dart';

class GridOrListBottomSheet extends StatelessWidget {
  const GridOrListBottomSheet({
    super.key,
    required this.gridOrListProvider,
    required this.isGridProvider,
  });

  final StateProvider<int> gridOrListProvider;
  final StateProvider<bool> isGridProvider;

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      children: [
        BottomSheetTitle(text: 'Tertiple'),
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
        FilterButton(isGridProvider: isGridProvider),
      ],
    );
  }
}
