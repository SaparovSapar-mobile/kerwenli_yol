import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_carousel_slider/home_carousel_slider.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_parts/home_parts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [HomeCarouselSlider(), HomeParts()]);
  }
}
