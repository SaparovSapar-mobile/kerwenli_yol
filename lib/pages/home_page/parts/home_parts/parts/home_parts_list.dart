import 'package:flutter/material.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_parts/parts/home_parts_card.dart';

class HomePartsList extends StatelessWidget {
  const HomePartsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 74,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => HomePartsCard(
          text: homeParts[index],
          isFirst: index == 0,
          isLast: index == homeParts.length - 1,
        ),
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: homeParts.length,
      ),
    );
  }
}
