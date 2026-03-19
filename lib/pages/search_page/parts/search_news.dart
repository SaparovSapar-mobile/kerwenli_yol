import 'package:flutter/widgets.dart';
import 'package:kerwenli_yol/models/news_model.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_news/parts/home_news_card.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';

class SearchNews extends StatelessWidget {
  const SearchNews({super.key, required this.news});

  final List<NewsModel> news;

  @override
  Widget build(BuildContext context) {
    final bool hasData = news.isNotEmpty;

    if (hasData) {
      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: news.length,
        itemBuilder: (context, index) =>
            HomeNewsCard(news: news[index], forListView: true),
      );
    } else {
      return NoResult();
    }
  }
}
