class GratitudeModel {
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
    );
  }

  factory GratitudeModel.fromJson(Map<String, dynamic> json) {
    return GratitudeModel(
      id: json['uuid'] ?? '',
      coverImg: json['cover_img'] ?? '',
      nameTm: json['name_tm'] ?? '',
      nameRu: json['name_ru'] ?? '',
      nameEn: json['name_en'] ?? '',
      descriptionTm: json['description_tm'] ?? '',
      descriptionRu: json['description_ru'] ?? '',
      descriptionEn: json['description_en'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}
