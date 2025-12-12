import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_bookmark_button.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/vip_text.dart';

class HomeVipCompanyCardImage extends StatelessWidget {
  const HomeVipCompanyCardImage({super.key});

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
                  HomeVipCompanyBookmarkButton(),

                  // Center placeholder icon
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
