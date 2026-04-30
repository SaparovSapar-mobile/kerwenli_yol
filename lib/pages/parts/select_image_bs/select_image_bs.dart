import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/file_functions.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/bottom_sheet_title.dart';
import 'package:kerwenli_yol/pages/parts/select_image_bs/parts/gallery_or_camera.dart';

class SelectImageBs extends ConsumerWidget {
  const SelectImageBs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    return BottomSheetWidget(
      children: [
        BottomSheetTitle(text: lang.selectImage),
        Row(
          children: [
            GalleryOrCamera(
              text: lang.gallery,
              icon: Icons.photo,
              onTap: () => getImageFromFolder(ref, context, 3, 4),
            ),
            SizedBox(width: 16),
            GalleryOrCamera(
              text: lang.camera,
              icon: Icons.photo_camera,
              onTap: () => getImageFromCamera(ref, context, 3, 4),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
