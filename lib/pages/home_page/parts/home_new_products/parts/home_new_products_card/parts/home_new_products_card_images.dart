import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/image_and_video.dart';
import 'package:kerwenli_yol/models/product.dart';
import 'package:kerwenli_yol/models/publication_model.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_banners/parts/banner_dots.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_new_products/parts/home_new_products_card/parts/images_left_right_button.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_new_products/parts/home_new_products_card/parts/zoom_images_button.dart';
import 'package:kerwenli_yol/pages/parts/card_favorite_button.dart';
import 'package:kerwenli_yol/pages/parts/card_top_texts/card_top_texts.dart';

class HomeNewProductsCardImages extends StatefulWidget {
  const HomeNewProductsCardImages({
    super.key,
    required this.product,
    this.width,
    this.height,
    this.cttHeight,
    this.cttFontSize,
    this.cttTopPosition,
    this.bbWith,
    this.bbHeight,
    this.bbIconSize,
    this.bbBorderRadius,
    this.bbRightPosition,
    this.bbTopPosition,
    this.dotsSize,
    this.dotsActiveWidth,
    this.dotsActiveHeight,
    this.forProductPage,
  });

  // final ExampleProductCard product;
  final ProductModel product;
  final double? width,
      height,
      cttHeight,
      cttFontSize,
      cttTopPosition,
      bbWith,
      bbHeight,
      bbIconSize,
      bbBorderRadius,
      bbRightPosition,
      bbTopPosition,
      dotsSize,
      dotsActiveWidth,
      dotsActiveHeight;
  final bool? forProductPage;

  @override
  State<HomeNewProductsCardImages> createState() =>
      _HomeNewProductsCardImagesState();
}

class _HomeNewProductsCardImagesState extends State<HomeNewProductsCardImages> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselCtrl = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    const double cardRadius = 8;
    // final images = widget.product.images;
    final ProductModel p = widget.product;
    final List<String> images = [p.coverImage];
    final int len = images.length;
    final bool hasMoreImages = len > 1;

    /// Üst etiketler
    final List<String> cardToptypes = [];
    for (final PublicationModel e in p.publications) {
      cardToptypes.add(e.nameEn.toLowerCase());
    }

    final bool forProdPage =
        widget.forProductPage != null && widget.forProductPage!;

    return SizedBox(
      width: widget.width ?? 100,
      height: widget.height ?? 100,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// VIP / NEW / EXPORT etiketleri
          CardTopTexts(
            types: cardToptypes,
            height: widget.cttHeight,
            fontSize: widget.cttFontSize,
            topPosition: widget.cttTopPosition,
          ),

          /// Main card
          SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(cardRadius),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F7FD),
                  borderRadius: BorderRadius.circular(cardRadius),
                ),
                child: Stack(
                  children: [
                    /// Image carousel
                    CarouselSlider.builder(
                      carouselController: _carouselCtrl,
                      itemCount: len,
                      itemBuilder: (context, index, realIndex) {
                        return SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: showImageMethod(
                            images[index],
                            0,
                            BoxFit.cover,
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: widget.height ?? 100,
                        viewportFraction: 1.0,
                        enableInfiniteScroll: hasMoreImages,
                        autoPlay: hasMoreImages,
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

                    // Left And Right Button
                    if (forProdPage)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ImagesLeftRightButton(
                                isLeftBtn: true,
                                onTap: () {
                                  if (len <= 1) return;

                                  if (_currentIndex > 0) {
                                    _carouselCtrl.previousPage();
                                  } else {
                                    _carouselCtrl.animateToPage(len - 1);
                                  }
                                },
                              ),
                              ImagesLeftRightButton(
                                isLeftBtn: false,
                                onTap: () {
                                  if (len <= 1) return;

                                  if (_currentIndex < len - 1) {
                                    _carouselCtrl.nextPage();
                                  } else {
                                    _carouselCtrl.animateToPage(0);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      const SizedBox.shrink(),

                    /// Favorite button
                    CardFavoriteButton(
                      productId: p.id,
                      width: widget.bbWith,
                      height: widget.bbHeight,
                      iconSize: widget.bbIconSize,
                      borderRadius: widget.bbBorderRadius,
                      rightPosition: widget.bbRightPosition,
                      topPosition: widget.bbTopPosition,
                    ),

                    /// Image dots
                    if (hasMoreImages)
                      Positioned(
                        right: 8,
                        bottom: 8,
                        child: BannerDots(
                          lenght: len,
                          page: _currentIndex,
                          dotsSize: widget.dotsSize ?? 2.83,
                          dotsActiveWidth: widget.dotsActiveWidth ?? 7.08,
                          dotsActiveHeight: widget.dotsActiveHeight ?? 2.83,
                        ),
                      )
                    else
                      const SizedBox.shrink(),

                    // Zoom Images Button
                    if (forProdPage)
                      Positioned(
                        left: 10,
                        bottom: 10,
                        child: ZoomImagesButton(),
                      )
                    else
                      const SizedBox.shrink(),
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
