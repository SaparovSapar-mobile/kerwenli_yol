import 'package:flutter/material.dart';
import 'package:kerwenli_yol/models/media.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_media/parts/home_media_card/home_media_card.dart';

class HomeMediaList extends StatelessWidget {
  const HomeMediaList({super.key, required this.medias});

  final List<MediaModel> medias;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => HomeMediaCard(
          isFirst: index == 0,
          isLast: index == 9,
          media: medias[index],
        ),
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: medias.length,
      ),
    );
  }
}
