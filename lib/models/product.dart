import 'dart:collection';

import 'package:kerwenli_yol/models/category.dart';
import 'package:kerwenli_yol/models/publication_model.dart';
import 'package:kerwenli_yol/models/translation.dart';

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
  final int likesCount;
  final List<PublicationModel> publications;
  final List<dynamic> galleryImages, videos;
  final num price;
  final bool isLiked;
  final CategoryModel category;
  final TranslationModel categoryName, companyName;

  /// Характеристики товара. Раньше страница товара показывала их
  /// захардкоженными ("Şetdaly çaga püresi" у насоса), потому что модель
  /// эти поля вообще не читала.
  final TranslationModel fcaPrice,
      minimumOrderQuantity,
      capacityPerMonth,
      orderCondition,
      paymentTerms,
      type,
      packaging,
      expirationDate,
      volume;

  /// Валюты оплаты приходят простым списком строк и с повторами.
  final List<String> payment;

  ProductModel({
    required this.id,
    required this.nameTm,
    required this.nameRu,
    required this.nameEn,
    required this.coverImage,
    required this.categoryId,
    required this.viewCount,
    this.likesCount = 0,
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
    required this.category,
    required this.categoryName,
    required this.companyName,
    required this.fcaPrice,
    required this.minimumOrderQuantity,
    required this.capacityPerMonth,
    required this.orderCondition,
    required this.paymentTerms,
    required this.type,
    required this.packaging,
    required this.expirationDate,
    required this.volume,
    required this.payment,
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
      category: CategoryModel.defaultValue(),
      categoryName: TranslationModel.defaultValue(),
      companyName: TranslationModel.defaultValue(),
      fcaPrice: TranslationModel.defaultValue(),
      minimumOrderQuantity: TranslationModel.defaultValue(),
      capacityPerMonth: TranslationModel.defaultValue(),
      orderCondition: TranslationModel.defaultValue(),
      paymentTerms: TranslationModel.defaultValue(),
      type: TranslationModel.defaultValue(),
      packaging: TranslationModel.defaultValue(),
      expirationDate: TranslationModel.defaultValue(),
      volume: TranslationModel.defaultValue(),
      payment: const [],
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
      viewCount: json['views_count'] ?? 0,
      likesCount: json['likes_count'] ?? 0,
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
      category: json['categories'] == null
          ? CategoryModel.defaultValue()
          : CategoryModel.fromJson(json['categories']),
      categoryName: TranslationModel.fromDynamic(json['category_name']),
      companyName: TranslationModel.fromDynamic(json['company_name']),
      // все эти поля сервер шлёт списком из одного объекта переводов,
      // fromDynamic это умеет
      fcaPrice: TranslationModel.fromDynamic(json['fca_price']),
      minimumOrderQuantity: TranslationModel.fromDynamic(
        json['minimum_order_quantity'],
      ),
      capacityPerMonth: TranslationModel.fromDynamic(json['capacity_per_month']),
      orderCondition: TranslationModel.fromDynamic(json['order_condition']),
      paymentTerms: TranslationModel.fromDynamic(json['payment_terms']),
      type: TranslationModel.fromDynamic(json['type']),
      packaging: TranslationModel.fromDynamic(json['packaging']),
      expirationDate: TranslationModel.fromDynamic(json['expiration_date']),
      volume: TranslationModel.fromDynamic(json['gowrimi']),
      // ["TMT", "TMT", "TMT"] -> ["TMT"]
      payment: json['payment'] is List
          ? LinkedHashSet<String>.from(
              (json['payment'] as List)
                  .map((e) => e.toString().trim())
                  .where((e) => e.isNotEmpty),
            ).toList()
          : const <String>[],
    );
  }
}
