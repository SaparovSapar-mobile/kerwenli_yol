import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';

Widget showImageMethod(String image, double borderRadius, BoxFit? boxFit) {
  String imageUrl = '$pathUrl/$image';

  if (image.isNotEmpty) {
    return ClipRRect(
      borderRadius: borderRadius != 0
          ? BorderRadius.circular(borderRadius)
          : BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        errorWidget: (context, url, error) => Center(child: errImage),
        placeholder: (context, url) => Center(child: errImage),
        fit: boxFit ?? BoxFit.cover,
      ),
    );
  }
  return Center(child: errImage);
}

Widget errImage = Center(
  child: Image.asset("assets/images/shimmer_logo.png", fit: BoxFit.cover),
);
