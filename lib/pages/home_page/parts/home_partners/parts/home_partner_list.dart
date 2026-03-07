import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/sponsor.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_partners/parts/home_partner_card.dart';

class HomePartnerList extends StatelessWidget {
  const HomePartnerList({super.key, required this.sponsors});

  final List<SponsorModel> sponsors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: homeSponsorsHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => HomePartnerCard(
          isFirst: index == 0,
          isLast: index == sponsors.length - 1,
          sponsor: sponsors[index],
        ),
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: sponsors.length,
      ),
    );
  }
}
