import 'package:flutter/material.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class VideoDuration extends StatelessWidget {
  const VideoDuration({
    super.key,
    required this.duration,
    this.icon,
    this.fontSize,
  });

  /// Готовая строка вида "02:20". Приходит из MediaModel.duration.
  final String duration;
  final IconData? icon;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    // Длительности нет - не показываем плашку вообще.
    // Раньше тут стояло жёстко "03:00" и врало на каждом видео.
    if (duration.isEmpty) return const SizedBox.shrink();

    // ======= Colors ======
    Color bgColor = Colors.black26;
    Color iconColor = Color(0xFFFFFFFF);

    // ======= Text Styles ======
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
          Text(duration, style: textStyle),
        ],
      ),
    );
  }
}
