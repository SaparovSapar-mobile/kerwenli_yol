import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kerwenli_yol/enums/card_top_text_type.dart';
import 'package:kerwenli_yol/examples.dart';
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

  final ExampleProductCard product;
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
    final images = widget.product.images;
    final len = images.length;

    /// Üst etiketler
    final List<String> cardToptypes = [];
    if (widget.product.forVip) cardToptypes.add(CardTopTextType.vip);
    if (widget.product.forNew) cardToptypes.add(CardTopTextType.taze);
    if (widget.product.forExport) cardToptypes.add(CardTopTextType.export);
    if (widget.product.forVirtual) cardToptypes.add(CardTopTextType.virtual);

    bool forProdPage = widget.forProductPage != null && widget.forProductPage!;

    return SizedBox(
      width: widget.width ?? 99,
      height: widget.height ?? 110,
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
                      width: widget.bbWith,
                      height: widget.bbHeight,
                      iconSize: widget.bbIconSize,
                      borderRadius: widget.bbBorderRadius,
                      rightPosition: widget.bbRightPosition,
                      topPosition: widget.bbTopPosition,
                    ),

                    /// Image dots
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: BannerDots(
                        lenght: len,
                        page: _currentIndex,
                        dotsSize: widget.dotsSize ?? 2.83,
                        dotsActiveWidth: widget.dotsActiveWidth ?? 7.08,
                        dotsActiveHeight: widget.dotsActiveHeight ?? 2.83,
                      ),
                    ),

                    // Zoom Images Button
                    Positioned(left: 10, bottom: 10, child: ZoomImagesButton()),
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
