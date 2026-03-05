import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/pages/example_widgets/medias_page/exm_media_card.dart';

class ExmMediasGridView extends StatelessWidget {
  const ExmMediasGridView({super.key});

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
      itemBuilder: (context, index) => ExmMediaCard(),
    );
  }
}
