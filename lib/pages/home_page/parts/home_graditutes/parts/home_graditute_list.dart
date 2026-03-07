import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/gratitude.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_graditutes/parts/home_graditute_card/home_graditute_card.dart';

class HomeGradituteList extends StatelessWidget {
  const HomeGradituteList({super.key, required this.gratitudes});

  final List<GratitudeModel> gratitudes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: homeGratutitudesHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => HomeGradituteCard(
          isFirst: index == 0,
          isLast: index == gratitudes.length - 1,
          gratitude: gratitudes[index],
        ),
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: gratitudes.length,
      ),
    );
  }
}
