import 'package:flutter/material.dart';

class HomeNewsList extends StatelessWidget {
  const HomeNewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 87,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Text('Tazelik'),
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: 10,
      ),
    );
  }
}
