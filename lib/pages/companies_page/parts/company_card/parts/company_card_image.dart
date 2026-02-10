import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/image_and_video.dart';
import 'package:kerwenli_yol/models/company.dart';
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
    required this.company,
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
  final CompanyModel company;

  @override
  Widget build(BuildContext context) {
    double cardRadius = cardRad ?? 10;
    bool forBookmark = forBookMark != null && forBookMark!;

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
                  // Bookmark box (sağ üst)
                  if (forBookmark)
                    const SizedBox.shrink()
                  else
                    Positioned(
                      right: 7,
                      top: 7,
                      child: CardBookmarkButton(
                        width: bookmarkButtonWith ?? 32,
                        height: bookmarkButtonHeight ?? 32,
                        iconSize: bookmarkButtonIconSize ?? 18,
                        borderRadius: bookmarkButtonBorderRadius ?? 8,
                      ),
                    ),

                  // ======= Card Image ========
                  showImageMethod(company.photo, 0, null),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
