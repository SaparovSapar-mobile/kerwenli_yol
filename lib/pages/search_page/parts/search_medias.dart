import 'package:flutter/widgets.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/media.dart';
import 'package:kerwenli_yol/pages/parts/media_card/media_card.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';

class SearchMedias extends StatelessWidget {
  const SearchMedias({super.key, required this.medias});

  final List<MediaModel> medias;

  @override
  Widget build(BuildContext context) {
    final bool hasData = medias.isNotEmpty;

    if (hasData) {
      return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 7,
          mainAxisSpacing: 7,
          mainAxisExtent: mediaCardHeight,
        ),
        itemCount: medias.length,
        itemBuilder: (context, index) => MediaCard(media: medias[index]),
      );
    } else {
      return NoResult();
    }
  }
}
