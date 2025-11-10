import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Row(
        children: [
          Text(text),
          SizedBox(width: 4),
          Icon(Icons.arrow_forward_ios, size: 18),
        ],
      ),
    );
  }
}
