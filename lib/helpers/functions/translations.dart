import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/enums/lang_type.dart';
import 'package:kerwenli_yol/providers/settings.dart';

String translateText(
  WidgetRef ref,
  String textTm,
  String textRu,
  String textEn,
  String textTr,
) {
  String lang = ref.watch(langProvider);

  switch (lang) {
    case LangType.tk:
      return textTm;
    case LangType.tr:
      return textTr;
    case LangType.ru:
      return textRu;
    case LangType.en:
      return textEn;
    default:
      return textTm;
  }
}

String translateImage(
  WidgetRef ref,
  String imageTm,
  String imageRu,
  String imageEn,
) {
  String lang = ref.watch(langProvider);

  switch (lang) {
    case LangType.tr:
      return imageTm;
    case LangType.ru:
      return imageRu;
    case LangType.en:
      return imageEn;
    default:
      return imageTm;
  }
}

String formatTwoLines10(String text) {
  const int maxPerLine = 20;
  const int maxTotal = maxPerLine * 2; // 20

  // Güvenli trim
  final t = text.trim();

  if (t.length <= maxPerLine) {
    return t; // Tek satır yeter
  }

  final first = t.substring(0, maxPerLine);

  if (t.length <= maxTotal) {
    final second = t.substring(maxPerLine);
    return '$first\n$second';
  }

  final second = t.substring(maxPerLine, maxTotal);
  return '$first\n$second…';
}
