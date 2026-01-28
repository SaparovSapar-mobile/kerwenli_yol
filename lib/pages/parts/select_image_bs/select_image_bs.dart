import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/bottom_sheet_title.dart';
import 'package:kerwenli_yol/pages/parts/select_image_bs/parts/gallery_or_camera.dart';

class SelectImageBs extends StatelessWidget {
  const SelectImageBs({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      children: [
        BottomSheetTitle(text: 'Select Image'),
        Row(
          children: [
            GalleryOrCamera(text: 'Gallery', icon: Icons.photo),
            SizedBox(width: 16),
            GalleryOrCamera(text: 'Camera', icon: Icons.photo_camera),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
