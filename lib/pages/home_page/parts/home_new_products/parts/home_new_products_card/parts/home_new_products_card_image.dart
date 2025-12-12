import 'package:flutter/material.dart';
import 'package:kerwenli_yol/enums/card_top_text_type.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/pages/parts/card_favorite_button.dart';
import 'package:kerwenli_yol/pages/parts/card_top_texts/card_top_texts.dart';

class HomeNewProductsCardImage extends StatelessWidget {
  const HomeNewProductsCardImage({super.key, required this.product});

  final ExampleProductCard product;

  @override
  Widget build(BuildContext context) {
    const double cardRadius = 8;

    List<String> cardToptypes = [];
    if (product.forVip) {
      cardToptypes.add(CardTopTextType.vip);
    }
    if (product.forNew) {
      cardToptypes.add(CardTopTextType.taze);
    }
    if (product.forExport) {
      cardToptypes.add(CardTopTextType.export);
    }
    if (product.forVirtual) {
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
                  CardFavoriteButton(),

                  // Company Image
                  Center(
                    child: Icon(
                      Icons.add_a_photo_outlined,
                      size: 14,
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
