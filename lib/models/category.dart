class CategoryModel {
  final String id, nameTm, nameRu, nameEn, imageTm, imageRu, imageEn;

  CategoryModel({
    required this.id,
    required this.nameTm,
    required this.nameRu,
    required this.nameEn,
    required this.imageTm,
    required this.imageRu,
    required this.imageEn,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['uuid'],
      nameTm: json['name_tm'],
      nameRu: json['name_ru'],
      nameEn: json['name_en'],
      imageTm: json['image_tm'] ?? '',
      imageRu: json['image_ru'] ?? '',
      imageEn: json['image_en'] ?? '',
    );
  }
}
