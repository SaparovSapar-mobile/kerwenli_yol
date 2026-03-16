import 'package:kerwenli_yol/models/publication_model.dart';

class ProductModel {
  final String id,
      nameTm,
      nameRu,
      nameEn,
      coverImage,
      categoryId,
      companyId,
      invoiceDate,
      date,
      descriptionTm,
      descriptionRu,
      descriptionEn;
  final int viewCount;
  final List<PublicationModel> publications;
  final List<dynamic> galleryImages, videos;
  final num price;
  final bool isLiked;

  ProductModel({
    required this.id,
    required this.nameTm,
    required this.nameRu,
    required this.nameEn,
    required this.coverImage,
    required this.categoryId,
    required this.viewCount,
    required this.publications,
    required this.companyId,
    required this.invoiceDate,
    required this.date,
    required this.galleryImages,
    required this.videos,
    required this.price,
    required this.isLiked,
    required this.descriptionTm,
    required this.descriptionRu,
    required this.descriptionEn,
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
      companyId: '',
      invoiceDate: '',
      date: '',
      galleryImages: [],
      videos: [],
      price: 0,
      isLiked: false,
      descriptionTm: '',
      descriptionRu: '',
      descriptionEn: '',
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['uuid'] ?? '',
      nameTm: json['name_tm'] ?? '',
      nameRu: json['name_ru'] ?? '',
      nameEn: json['name_en'] ?? '',
      descriptionTm: json['description_tm'] ?? '',
      descriptionRu: json['description_ru'] ?? '',
      descriptionEn: json['description_en'] ?? '',
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
      companyId: json['company_uuid'] ?? '',
      invoiceDate: json['invoice_date'] ?? '',
      date: json['date'] ?? '',
      galleryImages: json['gallery_images'] ?? [],
      videos: json['videos'] ?? [],
      price: json['price'] ?? 0,
      isLiked: json['is_liked'] ?? false,
    );
  }
}
