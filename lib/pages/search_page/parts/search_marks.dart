import 'package:flutter/widgets.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/mark.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';
import 'package:kerwenli_yol/pages/search_page/parts/mark_card.dart';

class SearchMarks extends StatelessWidget {
  const SearchMarks({super.key, required this.marks});

  final List<MarkModel> marks;

  @override
  Widget build(BuildContext context) {
    final bool hasData = marks.isNotEmpty;

    if (hasData) {
      return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: leaderCompanyCardHeight,
        ),
        itemCount: marks.length,
        itemBuilder: (context, index) => MarkCard(mark: marks[index]),
      );
    } else {
      return NoResult();
    }
  }
}
