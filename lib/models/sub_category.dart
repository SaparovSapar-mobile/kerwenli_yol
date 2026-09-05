import 'package:equatable/equatable.dart';

class SubCategoryModel extends Equatable {
  final String id, categoryId, nameTm, nameRu, nameEn, nameTr;

  const SubCategoryModel({
    required this.id,
    required this.categoryId,
    required this.nameTm,
    required this.nameRu,
    required this.nameEn,
    required this.nameTr,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['uuid'] ?? '',
      categoryId: json['category_id'] ?? '',
      nameTm: json['name_tm'] ?? '',
      nameRu: json['name_ru'] ?? '',
      nameEn: json['name_en'] ?? '',
      nameTr: json['name_tr'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, categoryId, nameTm, nameRu, nameEn, nameTr];
}
