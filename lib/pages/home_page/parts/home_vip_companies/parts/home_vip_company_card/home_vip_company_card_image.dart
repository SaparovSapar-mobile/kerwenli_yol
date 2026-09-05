import 'package:flutter/material.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/parts/card_bookmark_button.dart';
import 'package:kerwenli_yol/pages/parts/card_top_texts/card_top_texts.dart';

import '../../../../../../helpers/methods/static_data.dart';
import '../../../../../parts/show_image.dart';

class HomeVipCompanyCardImage extends StatelessWidget {
  const HomeVipCompanyCardImage({
    super.key,
    required this.cardTopTypes,
    required this.company,
  });

  final List<String> cardTopTypes;
  final CompanyModel company;

  @override
  Widget build(BuildContext context) {
    const double cardRadius = 8;

    return SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // VIP label (arkada, sol üst)
          CardTopTexts(types: cardTopTypes, topPosition: -8),

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
                  // Company Image
                  Center(
                    child: company.photo.isEmpty
                        ? Icon(
                            Icons.add_a_photo_outlined,
                            size: 14,
                            color: Color(0xFF9CB7FF),
                          )
                        : Image.network(
                            '$pathUrl${company.photo}',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Icon(
                              Icons.add_a_photo_outlined,
                              size: 14,
                              color: Color(0xFF9CB7FF),
                            ),
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Color(0xFF9CB7FF),
                                ),
                              );
                            },
                          ),
                  ),

                  // Bookmark box (sağ üst) - всегда поверх картинки
                  Positioned(
                    right: 4,
                    top: 4,
                    child: CardBookmarkButton(
                      companyId: company.individualUuid,
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
