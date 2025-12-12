import 'dart:async';
import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:flutter/material.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_banner/parts/banner_dots.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_banner/parts/home_banner_card.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({
    super.key,
    required this.height,
    required this.width,
    required this.borderRadius,
  });

  final double height, width, borderRadius;

  @override
  State<HomeBanner> createState() => _MainPageBannerPartState();
}

class _MainPageBannerPartState extends State<HomeBanner> {
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _nextImage();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _nextImage() {
    setState(() {
      int len = homeBanners.length;
      _currentIndex = (_currentIndex + 1) % len;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        clipBehavior: Clip.hardEdge, // veya Clip.antiAlias
        child: Stack(
          children: [
            AnimatedSwitcherPlus.translationLeft(
              duration: const Duration(milliseconds: 800),
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              child: HomeBannerCard(
                key: ValueKey(_currentIndex),
                height: widget.height,
                width: widget.width,
                image: homeBanners[_currentIndex],
              ),
            ),
            Positioned(
              left: 4,
              bottom: 4,
              child: BannerDots(
                lenght: homeBanners.length,
                page: _currentIndex,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
