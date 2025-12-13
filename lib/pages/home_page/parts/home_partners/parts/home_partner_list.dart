import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_media/parts/home_media_card/home_media_card.dart';

class HomePartnerList extends StatelessWidget {
  const HomePartnerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            MediaCard(isFirst: index == 0, isLast: index == 9),
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: 10,
      ),
    );
  }
}
