import 'package:flutter/material.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/bottom_sheet_title.dart';
import 'package:kerwenli_yol/pages/parts/select_image_bs/parts/gallery_or_camera.dart';

class SelectImageBs extends StatelessWidget {
  const SelectImageBs({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    return BottomSheetWidget(
      children: [
        BottomSheetTitle(text: lang.selectImage),
        Row(
          children: [
            GalleryOrCamera(text: lang.gallery, icon: Icons.photo),
            SizedBox(width: 16),
            GalleryOrCamera(text: lang.camera, icon: Icons.photo_camera),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
