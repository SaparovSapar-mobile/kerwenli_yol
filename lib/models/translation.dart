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

  /// Backend kä mahal {tm, ru, en} obyekt, kä mahal [{tm, ru, en}] list
  /// görnüşinde iberýär. Bu metod ikisini-de dogry parse edýär.
  static TranslationModel fromDynamic(dynamic data) {
    if (data == null) return TranslationModel.defaultValue();

    if (data is List) {
      if (data.isEmpty) return TranslationModel.defaultValue();
      return TranslationModel.fromJson(data.first as Map<String, dynamic>);
    }

    if (data is Map<String, dynamic>) {
      return TranslationModel.fromJson(data);
    }

    return TranslationModel.defaultValue();
  }
}