import 'package:flutter/widgets.dart';
import 'package:kerwenli_yol/models/media.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';

class SearchMedias extends StatelessWidget {
  const SearchMedias({super.key, required this.medias});

  final List<MediaModel> medias;

  @override
  Widget build(BuildContext context) {
    final bool hasData = medias.isNotEmpty;

    return hasData ? Center(child: Text('has data')) : NoResult();
  }
}
