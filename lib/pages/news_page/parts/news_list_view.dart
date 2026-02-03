import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_news/parts/home_news_card.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) => HomeNewsCard(),
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 10),
      itemCount: 12,
    );
  }
}
