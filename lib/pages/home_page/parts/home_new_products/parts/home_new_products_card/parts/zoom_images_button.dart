import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/parts/photos_viewer/photos_viewer.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class ZoomImagesButton extends ConsumerWidget {
  const ZoomImagesButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors =========
    final bool isLight = isLightTheme(context, ref);
    Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
    Color bgColor = isLight ? LightColors.bgBlogLight : DarkColors.bgBlogDark;

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => PhotosViewer(
            images: const [
              "assets/examples/foto.png",
              "assets/examples/foto.png",
              "assets/examples/foto.png",
              "assets/examples/foto.png",
              "assets/examples/foto.png",
              "assets/examples/foto.png",
            ],
            initialIndex: 0,
          ),
        ),
      ),
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8.8),
        ),
        child: Center(
          child: Icon(Icons.center_focus_weak, size: 16, color: iconColor),
        ),
      ),
    );
  }
}
