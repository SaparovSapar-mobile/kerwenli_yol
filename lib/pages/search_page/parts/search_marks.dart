import 'package:flutter/widgets.dart';
import 'package:kerwenli_yol/models/mark.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';

class SearchMarks extends StatelessWidget {
  const SearchMarks({super.key, required this.marks});

  final List<MarkModel> marks;

  @override
  Widget build(BuildContext context) {
    final bool hasData = marks.isNotEmpty;

    return hasData ? Center(child: Text('has data')) : NoResult();
  }
}
