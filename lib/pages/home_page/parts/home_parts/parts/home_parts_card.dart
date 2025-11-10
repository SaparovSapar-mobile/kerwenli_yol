import 'package:flutter/material.dart';

class HomePartsCard extends StatelessWidget {
  const HomePartsCard({
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
      width: 60,
      height: 74,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(left: isFirst ? 10 : 0, right: isLast ? 10 : 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          Image.asset('assets/examples/360.png', height: 36),
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(fontSize: 10),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
