import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/image_and_video.dart';

class AboutUsPhotos extends StatelessWidget {
  const AboutUsPhotos({super.key, required this.photos});

  final List<dynamic> photos;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 63,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => SizedBox(
          width: 100,
          child: showImageMethod(photos[index] as String, 4, null),
        ),
        separatorBuilder: (_, _) => const SizedBox(width: 5),
        itemCount: photos.length,
      ),
    );
  }
}
