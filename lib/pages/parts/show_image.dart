import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';

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

class ShowNetwImage extends StatelessWidget {
  const ShowNetwImage({super.key, this.borderRadius, required this.image});

  final double? borderRadius;
  final String image;

  @override
  Widget build(BuildContext context) {
    bool hasBorderRadius = borderRadius != 0 || borderRadius != null;

    return ClipRRect(
      borderRadius: hasBorderRadius
          ? BorderRadius.circular(8)
          : BorderRadius.zero,
      child: CachedNetworkImage(
        imageUrl: '$pathUrl$image',
        errorWidget: (context, url, error) => errImage,
        placeholder: (context, url) => errImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
