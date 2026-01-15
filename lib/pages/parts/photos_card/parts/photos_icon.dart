import 'package:flutter/material.dart';

class PhotosIcon extends StatelessWidget {
  const PhotosIcon({super.key});

  @override
  Widget build(BuildContext context) {
    // ======= Colors ======
    Color bgColor = Colors.black26;
    Color iconColor = Color(0xFFFFFFFF);

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Image.asset(
        'assets/images/photos.png',
        height: 10,
        width: 10,
        color: iconColor,
      ),
    );
  }
}
