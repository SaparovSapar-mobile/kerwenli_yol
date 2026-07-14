class GratitudeModel {
  final int viewsCount;
  final String id,
      coverImg,
      nameTm,
      nameRu,
      nameEn,
      descriptionTm,
      descriptionRu,
      descriptionEn,
      createdAt;

  GratitudeModel({
    required this.viewsCount,
    required this.id,
    required this.coverImg,
    required this.nameTm,
    required this.nameRu,
    required this.nameEn,
    required this.descriptionTm,
    required this.descriptionRu,
    required this.descriptionEn,
    required this.createdAt,
  });

  factory GratitudeModel.defaultValue() {
    return GratitudeModel(
      id: '',
      coverImg: '',
      nameTm: '',
      nameRu: '',
      nameEn: '',
      descriptionTm: '',
      descriptionRu: '',
      descriptionEn: '',
      createdAt: '',
      viewsCount: 0,
    );
  }

  factory GratitudeModel.fromJson(Map<String, dynamic> json) {
    return GratitudeModel(
      id: json['uuid'] ?? '',
      coverImg: json['cover_img'] ?? '',
      nameTm: json['name_tm'] ?? '',
      nameRu: json['name_ru'] ?? '',
      nameEn: json['name_en'] ?? '',
      descriptionTm: json['desc_tm'] ?? '',
      descriptionRu: json['desc_ru'] ?? '',
      descriptionEn: json['desc_en'] ?? '',
      createdAt: json['created_at'] ?? '',
      viewsCount: json['views_count'] ?? json['views'] ?? 0, // добавь
    );
  }
}
