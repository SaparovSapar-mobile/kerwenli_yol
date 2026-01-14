import 'package:flutter/material.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class VideoDuration extends StatelessWidget {
  const VideoDuration({super.key, this.icon, this.fontSize});

  final IconData? icon;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    Color bgColor = Colors.black26;
    Color iconColor = Color(0xFFFFFFFF);

    TextStyle textStyle = AppTextStyles.medium10.copyWith(
      fontSize: fontSize ?? 8,
      color: Colors.white,
    );

    bool hasIcon = icon != null;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Row(
        children: [
          if (hasIcon)
            Padding(
              padding: const EdgeInsets.only(right: 2),
              child: Icon(icon, size: 16, color: iconColor),
            )
          else
            const SizedBox.shrink(),
          Text('03:00', style: textStyle),
        ],
      ),
    );
  }
}
