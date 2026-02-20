class ProductModel {
  final String id, nameTm, nameRu, nameEn, coverImage;

  ProductModel({
    required this.id,
    required this.nameTm,
    required this.nameRu,
    required this.nameEn,
    required this.coverImage,
  });

  factory ProductModel.defaultValue() {
    return ProductModel(
      id: '',
      nameTm: '',
      nameRu: '',
      nameEn: '',
      coverImage: '',
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['uuid'] ?? '',
      nameTm: json['name_tm'] ?? '',
      nameRu: json['name_ru'] ?? '',
      nameEn: json['name_en'] ?? '',
      coverImage: json['cover_image'] ?? '',
    );
  }
}
