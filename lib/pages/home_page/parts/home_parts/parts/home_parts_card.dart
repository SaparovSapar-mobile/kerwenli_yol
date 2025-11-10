import 'package:flutter/material.dart';

class HomePartsCard extends StatelessWidget {
  const HomePartsCard({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 74,
      padding: EdgeInsets.all(5),
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
