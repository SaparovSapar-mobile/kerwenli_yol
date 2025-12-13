import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_graditutes/parts/home_graditute_card/home_graditute_card.dart';

class HomeGradituteList extends StatelessWidget {
  const HomeGradituteList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 106,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            HomeGradituteCard(isFirst: index == 0, isLast: index == 9),
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: 10,
      ),
    );
  }
}
