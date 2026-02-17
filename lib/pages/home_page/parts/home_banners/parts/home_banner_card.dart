import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/image_and_video.dart';

class HomeBannerCard extends StatelessWidget {
  const HomeBannerCard({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: showImageMethod(image, 0, null),
    );
  }
}
