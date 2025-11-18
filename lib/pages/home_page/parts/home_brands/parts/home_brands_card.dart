import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/show_image.dart';

class HomeBrandsCard extends StatelessWidget {
  const HomeBrandsCard({
    super.key,
    required this.text,
    required this.isFirst,
    required this.isLast,
  });

  final String text;
  final bool isFirst, isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 98,
      height: 80,
      margin: EdgeInsets.only(left: isFirst ? 10 : 0, right: isLast ? 10 : 0),
      child: Column(
        children: [
          SizedBox(
            width: 98,
            height: 80,
            child: ShowImage(
              image: 'assets/examples/home_brand.png',
              borderRadius: 5,
            ),
          ),
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(fontSize: 9),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
