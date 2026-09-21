import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/parts/photos_viewer/photos_viewer.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class ZoomImagesButton extends ConsumerWidget {
  const ZoomImagesButton({
    super.key,
    required this.images,
    this.initialIndex = 0,
  });

  /// Полные ссылки на картинки товара. Раньше тут был жёстко прописан
  /// assets/examples/foto.png - открывалась заглушка вместо товара.
  final List<String> images;
  final int initialIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors =========
    final bool isLight = isLightTheme(context, ref);
    Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
    Color bgColor = isLight ? LightColors.bgBlogLight : DarkColors.bgBlogDark;

    return GestureDetector(
      onTap: images.isEmpty
          ? null
          : () => Navigator.of(context).push(
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (_) => PhotosViewer(
                  images: images,
                  initialIndex: initialIndex.clamp(0, images.length - 1),
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
