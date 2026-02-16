class TranslationModel {
  final String tm, ru, en;

  TranslationModel({required this.tm, required this.ru, required this.en});

  factory TranslationModel.fromJson(Map<String, dynamic> json) {
    return TranslationModel(
      tm: json['tm'] ?? '',
      ru: json['ru'] ?? '',
      en: json['en'] ?? '',
    );
  }

  factory TranslationModel.defaultValue() {
    return TranslationModel(tm: '', ru: '', en: '');
  }
}
