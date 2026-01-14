import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/pages/parts/wideo_card/wideo_card.dart';

class WideosGridView extends StatelessWidget {
  const WideosGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 7,
        mainAxisSpacing: 7,
        mainAxisExtent: wideoCardHeight,
      ),
      itemBuilder: (context, index) => WideoCard(),
    );
  }
}
