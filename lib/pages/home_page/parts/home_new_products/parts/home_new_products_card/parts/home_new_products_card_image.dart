import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/card_favorite_button.dart';
import 'package:kerwenli_yol/pages/parts/vip_text.dart';

class HomeNewProductsCardImage extends StatelessWidget {
  const HomeNewProductsCardImage({super.key});

  @override
  Widget build(BuildContext context) {
    const double cardRadius = 8;

    return SizedBox(
      width: 99,
      height: 110,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // VIP label (arkada, sol üst)
          VipText(),

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
