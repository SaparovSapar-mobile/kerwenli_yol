import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/bottom_sheet_title.dart';
import 'package:kerwenli_yol/pages/parts/cp_message_bs/parts/cp_message_bs_list_tile.dart';

// ===== Company Page Message Bottom Sheet =====
class MessageBs extends StatelessWidget {
  const MessageBs({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      children: [
        BottomSheetTitle(text: 'Hat Yazmak', icon: 'messages.png'),
        CpMessageBsListTile(
          title: 'Nagilelik bildirmek',
          index: 0,
          image: 'flag.png',
        ),
        CpMessageBsListTile(
          title: 'Hat yazmak',
          index: 1,
          image: 'messages.png',
        ),
      ],
    );
  }
}
