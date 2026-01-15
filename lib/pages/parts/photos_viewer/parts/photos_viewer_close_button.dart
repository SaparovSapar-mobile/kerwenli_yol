import 'package:flutter/material.dart';

class PhotosViewerCloseButton extends StatelessWidget {
  const PhotosViewerCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    // ====== Colors =======
    Color bgColor = Color(0xFF191919);

    return GestureDetector(
      onTap: () => Navigator.of(context).maybePop(),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
        child: const Icon(Icons.close, color: Colors.white, size: 20),
      ),
    );
  }
}
