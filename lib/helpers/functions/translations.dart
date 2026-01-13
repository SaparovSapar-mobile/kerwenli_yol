import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/enums/lang_type.dart';
import 'package:kerwenli_yol/providers/settings.dart';

String translateText(
  WidgetRef ref,
  String textTm,
  String textRu,
  String textEn,
) {
  String lang = ref.watch(langProvider);

  switch (lang) {
    case LangType.tr:
      return textTm;
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
