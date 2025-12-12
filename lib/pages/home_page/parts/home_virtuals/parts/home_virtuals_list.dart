import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_virtuals/parts/home_virtual_card.dart';

class HomeVirtualsList extends StatelessWidget {
  const HomeVirtualsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 202,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            HomeVirtualCard(isFirst: index == 0, isLast: index == 9),
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: 10,
      ),
    );
  }
}
