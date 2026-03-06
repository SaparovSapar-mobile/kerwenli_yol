class NewsModel {
  final String id,
      nameTm,
      nameRu,
      nameEn,
      descriptionTm,
      descriptionRu,
      descriptionEn,
      coverImage,
      updatedAt;
  final List<dynamic> galleryImages;
  final int viewsCount;

  NewsModel({
    required this.id,
    required this.nameTm,
    required this.nameRu,
    required this.nameEn,
    required this.descriptionTm,
    required this.descriptionRu,
    required this.descriptionEn,
    required this.coverImage,
    required this.updatedAt,
    required this.galleryImages,
    required this.viewsCount,
  });

  factory NewsModel.defaultValue() {
    return NewsModel(
      id: '',
      nameTm: '',
      nameRu: '',
      nameEn: '',
      descriptionTm: '',
      descriptionRu: '',
      descriptionEn: '',
      coverImage: '',
      updatedAt: '',
      galleryImages: [],
      viewsCount: 0,
    );
  }

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['uuid'] ?? '',
      nameTm: json['name_tm'] ?? '',
      nameRu: json['name_ru'] ?? '',
      nameEn: json['name_en'] ?? '',
      descriptionTm: json['description_tm'] ?? '',
      descriptionRu: json['description_ru'] ?? '',
      descriptionEn: json['description_en'] ?? '',
      coverImage: json['cover_image'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      galleryImages: json['gallery_images'] ?? [],
      viewsCount: json['views_count'] ?? 0,
    );
  }
}
