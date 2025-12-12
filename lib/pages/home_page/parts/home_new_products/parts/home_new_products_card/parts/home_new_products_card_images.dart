import 'dart:async';

import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:flutter/material.dart';
import 'package:kerwenli_yol/enums/card_top_text_type.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_banners/parts/banner_dots.dart';
import 'package:kerwenli_yol/pages/parts/card_favorite_button.dart';
import 'package:kerwenli_yol/pages/parts/card_top_texts/card_top_texts.dart';

class HomeNewProductsCardImages extends StatefulWidget {
  const HomeNewProductsCardImages({super.key, required this.product});

  final ExampleProductCard product;

  @override
  State<HomeNewProductsCardImages> createState() =>
      _HomeNewProductsCardImagesState();
}

class _HomeNewProductsCardImagesState extends State<HomeNewProductsCardImages> {
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
      int len = widget.product.images.length;
      _currentIndex = (_currentIndex + 1) % len;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double cardRadius = 8;
    List<int> images = widget.product.images;

    List<String> cardToptypes = [];
    if (widget.product.forVip) {
      cardToptypes.add(CardTopTextType.vip);
    }
    if (widget.product.forNew) {
      cardToptypes.add(CardTopTextType.taze);
    }
    if (widget.product.forExport) {
      cardToptypes.add(CardTopTextType.export);
    }
    if (widget.product.forVirtual) {
      cardToptypes.add(CardTopTextType.virtual);
    }

    return SizedBox(
      width: 99,
      height: 110,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // VIP label (arkada, sol üst)
          CardTopTexts(types: cardToptypes),

          // Main card
          SizedBox(
            width: 99,
            height: 110,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(cardRadius),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F7FD),
                  borderRadius: BorderRadius.circular(cardRadius),
                ),
                child: Stack(
                  children: [
                    // Bookmark box (sağ üst)
                    CardFavoriteButton(),

                    // Company Image
                    AnimatedSwitcherPlus.translationLeft(
                      duration: const Duration(milliseconds: 800),
                      switchInCurve: Curves.easeOut,
                      switchOutCurve: Curves.easeIn,
                      child: Center(
                        key: ValueKey(_currentIndex),
                        child: Icon(
                          Icons.add_a_photo_outlined,
                          size: 14,
                          color: Color(0xFF9CB7FF),
                        ),
                      ),
                    ),

                    // Image dots
                    Positioned(
                      right: 4,
                      bottom: 4,
                      child: BannerDots(
                        lenght: images.length,
                        page: _currentIndex,
                        dotsSize: 2.83,
                        dotsActiveWidth: 7.08,
                        dotsActiveHeight: 2.83,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
