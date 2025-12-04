import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/parts/show_image.dart';

class HomeCarouselSliderCard extends StatelessWidget {
  const HomeCarouselSliderCard({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: screenProperties(context).width - 40,
      child: ShowImage(image: image, borderRadius: 10),
    );
  }
}
