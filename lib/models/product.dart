import 'package:kerwenli_yol/models/publication_model.dart';

class ProductModel {
  final String id, nameTm, nameRu, nameEn, coverImage, categoryId;
  final int viewCount;
  final List<PublicationModel> publications;

  ProductModel({
    required this.id,
    required this.nameTm,
    required this.nameRu,
    required this.nameEn,
    required this.coverImage,
    required this.categoryId,
    required this.viewCount,
    required this.publications,
  });

  factory ProductModel.defaultValue() {
    return ProductModel(
      id: '',
      nameTm: '',
      nameRu: '',
      nameEn: '',
      coverImage: '',
      categoryId: '',
      viewCount: 0,
      publications: [],
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['uuid'] ?? '',
      nameTm: json['name_tm'] ?? '',
      nameRu: json['name_ru'] ?? '',
      nameEn: json['name_en'] ?? '',
      coverImage: json['cover_image'] ?? '',
      categoryId: json['category_uuid'] ?? '',
      viewCount: json['view_count'] ?? 0,
      publications: json['publications'] == null || json['publications'] == []
          ? []
          : List<PublicationModel>.from(
              json['publications'].map(
                (dataJson) => PublicationModel.fromJson(dataJson),
              ),
            ),
    );
  }
}
