import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kerwenli_yol/enums/card_top_text_type.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_banners/parts/banner_dots.dart';
import 'package:kerwenli_yol/pages/parts/card_favorite_button.dart';
import 'package:kerwenli_yol/pages/parts/card_top_texts/card_top_texts.dart';

class HomeNewProductsCardImages extends StatefulWidget {
  const HomeNewProductsCardImages({
    super.key,
    required this.product,
    this.width,
    this.height,
  });

  final ExampleProductCard product;
  final double? width, height;

  @override
  State<HomeNewProductsCardImages> createState() =>
      _HomeNewProductsCardImagesState();
}

class _HomeNewProductsCardImagesState extends State<HomeNewProductsCardImages> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    const double cardRadius = 8;
    final images = widget.product.images;
    final len = images.length;

    /// Üst etiketler
    final List<String> cardToptypes = [];
    if (widget.product.forVip) cardToptypes.add(CardTopTextType.vip);
    if (widget.product.forNew) cardToptypes.add(CardTopTextType.taze);
    if (widget.product.forExport) cardToptypes.add(CardTopTextType.export);
    if (widget.product.forVirtual) cardToptypes.add(CardTopTextType.virtual);

    return SizedBox(
      width: widget.width ?? 99,
      height: widget.height ?? 110,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// VIP / NEW / EXPORT etiketleri
          CardTopTexts(types: cardToptypes),

          /// Main card
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
                    /// Favorite button
                    const CardFavoriteButton(),

                    /// Image carousel
                    CarouselSlider.builder(
                      itemCount: len,
                      itemBuilder: (context, index, realIndex) {
                        // Burada gerçek resim widget’ını koyabilirsin
                        return Center(
                          child: Icon(
                            Icons.add_a_photo_outlined,
                            size: 14,
                            color: const Color(0xFF9CB7FF),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: 110,
                        viewportFraction: 1,
                        enableInfiniteScroll: len > 1,
                        autoPlay: len > 1,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: const Duration(
                          milliseconds: 800,
                        ),
                        autoPlayCurve: Curves.easeOut,
                        pauseAutoPlayOnTouch: true,
                        onPageChanged: (index, reason) {
                          setState(() => _currentIndex = index);
                        },
                      ),
                    ),

                    /// Image dots
                    Positioned(
                      right: 4,
                      bottom: 4,
                      child: BannerDots(
                        lenght: len,
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
