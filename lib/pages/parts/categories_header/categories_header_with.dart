import 'package:flutter/material.dart';

class CategoriesHeaderWith extends StatelessWidget {
  const CategoriesHeaderWith({
    super.key,
    required this.categories,
    required this.childWidget,
  });

  final List<String> categories;
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Column(
        children: [
          SizedBox(height: 5),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: categories.map((e) => childWidget).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
