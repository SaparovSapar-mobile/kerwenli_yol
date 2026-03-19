import 'package:flutter/widgets.dart';
import 'package:kerwenli_yol/models/news_model.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';

class SearchNews extends StatelessWidget {
  const SearchNews({super.key, required this.news});

  final List<NewsModel> news;

  @override
  Widget build(BuildContext context) {
    final bool hasData = news.isNotEmpty;

    return hasData ? Center(child: Text('has data')) : NoResult();
  }
}
