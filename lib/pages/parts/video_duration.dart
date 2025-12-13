import 'package:flutter/material.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class VideoDuration extends StatelessWidget {
  const VideoDuration({super.key});

  @override
  Widget build(BuildContext context) {
    Color bgColor = Colors.black26;

    TextStyle textStyle = AppTextStyles.medium10.copyWith(
      fontSize: 8,
      color: Colors.white,
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text('03:00', style: textStyle),
    );
  }
}
