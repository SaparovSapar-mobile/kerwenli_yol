import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kerwenli_yol/models/banner.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_banners/parts/banner_dots.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_banners/parts/home_banner_card.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({
    super.key,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.dotsLeft,
    required this.dotsBottom,
    required this.dotsSize,
    required this.dotsActiveWidth,
    required this.dotsActiveHeight,
    required this.banners,
    required this.isBig,
  });

  final double height,
      width,
      borderRadius,
      dotsLeft,
      dotsBottom,
      dotsSize,
      dotsActiveWidth,
      dotsActiveHeight;
  final bool isBig;

  final List<BannerModel> banners;

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  final CarouselSliderController _controller = CarouselSliderController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final int len = widget.banners.length;
    final bool hasBanners = len != 0;
    final bool hasMore = len > 1;

    return SizedBox(
      width: widget.width,
      height: widget.isBig ? widget.height - 20 : widget.height,
      child: !hasBanners
          ? const SizedBox.shrink()
          : ClipRRect(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              clipBehavior: Clip.hardEdge,
              child: Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: len,
                    itemBuilder: (context, index, realIndex) {
                      return HomeBannerCard(banner: widget.banners[index]);
                    },
                    options: CarouselOptions(
                      height: widget.height,
                      viewportFraction: 1.0,
                      padEnds: false,
                      pageSnapping: true,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.25, // ← маленький зазор между слайдами
                      enableInfiniteScroll: hasMore,
                      autoPlay: hasMore,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(
                        milliseconds: 800,
                      ),
                      autoPlayCurve: Curves.easeOut,
                      pauseAutoPlayOnTouch: true,
                      pauseAutoPlayOnManualNavigate: true,
                      pauseAutoPlayInFiniteScroll: true,
                      onPageChanged: (index, reason) {
                        setState(() => _currentIndex = index);
                      },
                    ),
                    carouselController: _controller,
                  ),

                  if (hasMore)
                    Positioned(
                      left: widget.dotsLeft,
                      bottom: widget.dotsBottom,
                      child: BannerDots(
                        lenght: len,
                        page: _currentIndex,
                        dotsSize: widget.dotsSize,
                        dotsActiveWidth: widget.dotsActiveWidth,
                        dotsActiveHeight: widget.dotsActiveHeight,
                      ),
                    )
                  else
                    const SizedBox.shrink(),
                ],
              ),
            ),
    );
  }
}
