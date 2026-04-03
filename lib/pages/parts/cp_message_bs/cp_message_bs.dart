import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/bottom_sheet_title.dart';
import 'package:kerwenli_yol/pages/parts/cp_message_bs/parts/cp_message_bs_list_tile.dart';

// ===== Company Page Message Bottom Sheet =====
class CpMessageBs extends StatelessWidget {
  const CpMessageBs({super.key, required this.companyId});

  final String companyId;

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      children: [
        BottomSheetTitle(text: 'Sazlamalar'),
        CpMessageBsListTile(
          title: 'Nagilelik bildirmek',
          index: 0,
          image: 'flag.png',
          companyId: companyId,
        ),
        CpMessageBsListTile(
          title: 'Hat yazmak',
          index: 1,
          image: 'messages.png',
          companyId: companyId,
        ),
      ],
    );
  }
}
