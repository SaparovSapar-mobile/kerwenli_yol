import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/pages/parts/show_image.dart';

class HomeBannerCard extends ConsumerWidget {
  const HomeBannerCard({
    super.key,
    required this.image,
    required this.height,
    required this.width,
    required this.borderRadius,
  });

  final String image;
  final double height, width, borderRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ShowImage(image: image),
      ),
    );
  }
}
