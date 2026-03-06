import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/news_model.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_news/parts/home_news_card.dart';

class HomeNewsList extends StatelessWidget {
  const HomeNewsList({super.key, required this.news});

  final List<NewsModel> news;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: newsListCardHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => HomeNewsCard(
          isFirst: index == 0,
          isLast: index == news.length - 1,
          width: 238,
        ),
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: news.length,
      ),
    );
  }
}
