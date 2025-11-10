import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_carousel_slider/parts/home_carousel_slider_card.dart';

class HomeCarouselSlider extends StatelessWidget {
  const HomeCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: homeBanners.length,
      itemBuilder: (context, index, realIndex) =>
          HomeCarouselSliderCard(image: homeBanners[index]),
      options: CarouselOptions(
        viewportFraction: .92,
        enableInfiniteScroll: true,
        height: 174,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
      ),
    );
  }
}
