import 'package:equatable/equatable.dart';
import 'package:kerwenli_yol/models/sub_category.dart';

class CategoryModel extends Equatable {
  final String id, nameTm, nameRu, nameEn, imageTm, imageRu, imageEn;
  final List<SubCategoryModel> subCategories;

  const CategoryModel({
    required this.id,
    required this.nameTm,
    required this.nameRu,
    required this.nameEn,
    required this.imageTm,
    required this.imageRu,
    required this.imageEn,
    this.subCategories = const [],
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic>? subCategoriesData = json['sub_categories'] as List?;

    return CategoryModel(
      id: json['uuid'] ?? '',
      nameTm: json['name_tm'] ?? '',
      nameRu: json['name_ru'] ?? '',
      nameEn: json['name_en'] ?? '',
      imageTm: json['image_tm'] ?? '',
      imageRu: json['image_ru'] ?? '',
      imageEn: json['image_en'] ?? '',
      subCategories: subCategoriesData == null
          ? []
          : subCategoriesData
                .map(
                  (e) => SubCategoryModel.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
    );
  }

  factory CategoryModel.defaultValue() {
    return CategoryModel(
      id: '',
      nameTm: '',
      nameRu: '',
      nameEn: '',
      imageTm: '',
      imageRu: '',
      imageEn: '',
    );
  }

  @override
  List<Object?> get props => [
    id,
    nameTm,
    nameRu,
    nameEn,
    imageTm,
    imageRu,
    imageEn,
    subCategories,
  ];
}
