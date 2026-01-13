import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/card_bookmark_button.dart';
import 'package:kerwenli_yol/pages/parts/card_top_texts/card_top_texts.dart';

class CompanyCardImage extends StatelessWidget {
  const CompanyCardImage({
    super.key,
    required this.cardTopTypes,
    this.height,
    this.width,
  });

  final List<String> cardTopTypes;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    const double cardRadius = 10;

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
            fontSize: 9,
            topPosition: -10,
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
                  Positioned(
                    right: 7,
                    top: 7,
                    child: CardBookmarkButton(
                      width: 32,
                      height: 32,
                      iconSize: 18,
                      borderRadius: 8,
                    ),
                  ),

                  // Company Image
                  Center(
                    child: Icon(
                      Icons.add_a_photo_outlined,
                      size: 22,
                      color: Color(0xFF9CB7FF),
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
