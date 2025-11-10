import 'package:flutter/material.dart';
import 'package:kerwenli_yol/examples.dart';

class HomePartsList extends StatelessWidget {
  const HomePartsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 74,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Text(homeParts[index]),
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: homeParts.length,
      ),
    );
  }
}
