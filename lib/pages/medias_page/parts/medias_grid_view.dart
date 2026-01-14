import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/pages/parts/media_card/media_card.dart';

class MediasGridView extends StatelessWidget {
  const MediasGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 7,
        mainAxisSpacing: 7,
        mainAxisExtent: mediaCardHeight,
      ),
      itemBuilder: (context, index) => MediaCard(),
    );
  }
}
