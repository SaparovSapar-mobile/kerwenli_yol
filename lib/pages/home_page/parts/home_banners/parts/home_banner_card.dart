import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/pages/parts/show_image.dart';

class HomeBannerCard extends ConsumerWidget {
  const HomeBannerCard({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {},
      child: ShowImage(image: image),
    );
  }
}
