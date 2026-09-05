import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/image_and_video.dart';
import 'package:kerwenli_yol/pages/parts/card_bookmark_button.dart';
import 'package:kerwenli_yol/pages/parts/card_top_texts/card_top_texts.dart';

class CompanyCardImage extends StatelessWidget {
  const CompanyCardImage({
    super.key,
    required this.cardTopTypes,
    this.height,
    this.width,
    this.bookmarkButtonWith,
    this.bookmarkButtonHeight,
    this.bookmarkButtonIconSize,
    this.bookmarkButtonBorderRadius,
    this.forBookMark,
    this.cttSize,
    this.cttTopPosition,
    this.cardRad,
    this.companyId,
    required this.image,
  });

  final List<String> cardTopTypes;
  final double? height,
      width,
      bookmarkButtonWith,
      bookmarkButtonHeight,
      bookmarkButtonIconSize,
      bookmarkButtonBorderRadius,
      cttSize,
      cttTopPosition,
      cardRad;
  final bool? forBookMark;
  final String image;
  final String? companyId;

  @override
  Widget build(BuildContext context) {
    final double cardRadius = cardRad ?? 10;
    final bool forBm = forBookMark != null && forBookMark!;
    final String compId = companyId ?? '';

    return SizedBox(
      height: height ?? 156,
      width: width,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // VIP label (arkada, sol üst)
          CardTopTexts(
            types: cardTopTypes,
            height: 27,
            fontSize: cttSize ?? 9,
            topPosition: cttTopPosition ?? -10,
          ),

          // Main card
          ClipRRect(
            borderRadius: BorderRadius.circular(cardRadius),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF4F7FD),
                borderRadius: BorderRadius.circular(cardRadius),
              ),
              child: Stack(
                children: [
                  // ======= Card Image ========
                  SizedBox(
                    height: height ?? 156,
                    width: width,
                    child: showImageMethod(image, 0, null),
                  ),

                  // Bookmark box (sağ üst) - всегда поверх картинки
                  if (!forBm)
                    Positioned(
                      right: 7,
                      top: 7,
                      child: CardBookmarkButton(
                        companyId: compId,
                        width: bookmarkButtonWith ?? 32,
                        height: bookmarkButtonHeight ?? 32,
                        iconSize: bookmarkButtonIconSize ?? 18,
                        borderRadius: bookmarkButtonBorderRadius ?? 8,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
