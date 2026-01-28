import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/bg_page_light_button.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/bottom_sheet_title.dart';

class BookMarkSettingBs extends StatelessWidget {
  const BookMarkSettingBs({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      children: [
        BottomSheetTitle(text: 'Sazlamalar'),
        SizedBox(height: 10),
        BgPageLightButton(
          text: 'Ahli bookmarklary pozmak',
          onPressed: () {},
          icon: Icons.delete,
        ),
      ],
    );
  }
}
