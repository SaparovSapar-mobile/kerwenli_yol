class AboutUsModel {
  final String nameTm,
      nameRu,
      nameEn,
      nameTr,
      descriptionTm,
      descriptionRu,
      descriptionEn,
      descriptionTr,
      basePhoto;
  List<dynamic> photos;

  AboutUsModel({
    required this.nameTm,
    required this.nameRu,
    required this.nameEn,
    required this.nameTr,
    required this.descriptionTm,
    required this.descriptionRu,
    required this.descriptionEn,
    required this.descriptionTr,
    required this.basePhoto,
    required this.photos,
  });

  /// Сервер отдаёт только тексты: ни base_photo, ни photos в ответе
  /// /client/about нет. Раньше их читали как non-nullable String, парсинг
  /// падал и страница "Kärhana barada" оставалась пустой - поэтому здесь
  /// все поля необязательные.
  static String _str(dynamic value) => value is String ? value : '';

  factory AboutUsModel.fromJson(Map<String, dynamic> json) {
    final String descTm = _str(json['description_tm']);

    return AboutUsModel(
      nameTm: _str(json['name_tm']),
      nameRu: _str(json['name_ru']),
      nameEn: _str(json['name_en']),
      // турецкого текста у старой версии модели не было, хотя сервер его шлёт
      nameTr: _str(json['name_tr']).isEmpty
          ? _str(json['name_tm'])
          : _str(json['name_tr']),
      descriptionTm: descTm,
      descriptionRu: _str(json['description_ru']),
      descriptionEn: _str(json['description_en']),
      descriptionTr: _str(json['description_tr']).isEmpty
          ? descTm
          : _str(json['description_tr']),
      basePhoto: _str(json['base_photo']),
      photos: json['photos'] is List ? json['photos'] as List<dynamic> : [],
    );
  }

  /// Пусто, если не пришло ни названия, ни текста - показывать нечего.
  bool get isEmpty =>
      nameTm.isEmpty &&
      nameRu.isEmpty &&
      nameEn.isEmpty &&
      descriptionTm.isEmpty &&
      descriptionRu.isEmpty &&
      descriptionEn.isEmpty;

  factory AboutUsModel.defaultValue() {
    return AboutUsModel(
      nameTm: '',
      nameRu: '',
      nameEn: '',
      nameTr: '',
      descriptionTm: '',
      descriptionRu: '',
      descriptionEn: '',
      descriptionTr: '',
      basePhoto: '',
      photos: [],
    );
  }
}
