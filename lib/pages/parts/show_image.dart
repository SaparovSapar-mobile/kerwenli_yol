import 'package:flutter/material.dart';

class ShowImage extends StatelessWidget {
  const ShowImage({super.key, this.borderRadius, required this.image});

  final double? borderRadius;
  final String image;

  @override
  Widget build(BuildContext context) {
    bool hasBorderRadius = borderRadius != 0 || borderRadius != null;

    return ClipRRect(
      borderRadius: hasBorderRadius
          ? BorderRadius.circular(8)
          : BorderRadius.zero,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
