import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/example_widgets/news_page/exm_home_news_card.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) => ExmHomeNewsCard(),
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 10),
      itemCount: 12,
    );
  }
}
