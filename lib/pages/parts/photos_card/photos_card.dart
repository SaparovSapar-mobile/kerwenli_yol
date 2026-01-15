import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/photos_card/parts/photos_icon.dart';
import 'package:kerwenli_yol/pages/parts/photos_viewer/photos_viewer.dart';
import 'package:kerwenli_yol/pages/parts/show_image.dart';

class PhotosCard extends StatelessWidget {
  const PhotosCard({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 112,
              child: ShowImage(image: 'assets/examples/foto.png'),
            ),
            Positioned(left: 5, bottom: 5, child: PhotosIcon()),
          ],
        ),
      ),
    );
  }
}
