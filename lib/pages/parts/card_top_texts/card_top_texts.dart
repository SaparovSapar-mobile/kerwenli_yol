import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/card_top_texts/parts/card_top_text.dart';

class CardTopTexts extends StatelessWidget {
  const CardTopTexts({super.key, required this.types, this.max = 4});

  final List<String> types;
  final int max;

  @override
  Widget build(BuildContext context) {
    final items = types.take(max).toList();

    return Positioned(
      top: -6,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < items.length; i++) ...[
            CardTopText(cardTopTextType: items[i]),
          ],
        ],
      ),
    );
  }
}
