import 'package:flutter/material.dart';
import 'package:kerwenli_yol/enums/card_top_text_type.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class CardTopText extends StatelessWidget {
  const CardTopText({
    super.key,
    required this.cardTopTextType,
    this.height,
    this.fontSize,
  });

  final String cardTopTextType;
  final double? height, fontSize;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations lang = AppLocalizations.of(context)!;
    final TextStyle textStyle = AppTextStyles.semiBold6;

    String text = "VIP";
    Color cardColor = const Color(0xFFFBB725);

    switch (cardTopTextType) {
      case CardTopTextType.news:
        text = lang.news;
        cardColor = const Color(0xFFFFC13C);
        break;
      case CardTopTextType.vip:
        text = "VIP";
        cardColor = const Color(0xFFFBB725);
        break;
      case CardTopTextType.taze:
        text = "New";
        cardColor = const Color(0xFF2BC171);
        break;
      case CardTopTextType.export:
        text = lang.export;
        cardColor = const Color(0xFFF3690D);
        break;
      case CardTopTextType.virtual:
        text = "360°";
        cardColor = const Color(0xFFFF5050);
        break;
      default:
        text = "VIP";
        cardColor = const Color(0xFFFBB725);
    }

    return Container(
      height: height ?? 18,
      alignment: Alignment.topCenter,
      padding: EdgeInsets.symmetric(horizontal: 4.6),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        text,
        style: textStyle.copyWith(color: Colors.white),
      ),
    );
  }
}
