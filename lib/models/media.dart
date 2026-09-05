import 'package:kerwenli_yol/models/sub_category.dart';
import 'package:kerwenli_yol/models/translation.dart';

class MediaModel {
  final String id, coverImage, name;
  final List<dynamic> videoPaths;
  final int viewNumber;
  final TranslationModel categoryName;
  final List<SubCategoryModel> subcategories;

  MediaModel({
    required this.id,
    required this.coverImage,
    required this.videoPaths,
    required this.viewNumber,
    this.name = '',
    TranslationModel? categoryName,
    this.subcategories = const [],
  }) : categoryName = categoryName ?? TranslationModel.defaultValue();

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic>? subcategoriesData = json['subcategories'] as List?;

    return MediaModel(
      id: json['uuid'] ?? '',
      coverImage: json['cover_image'] ?? '',
      viewNumber: json['view_number'] ?? 0,
      videoPaths: json['video_paths'] ?? [],
      name: json['name'] ?? '',
      categoryName: TranslationModel.fromDynamic(json['category_name']),
      subcategories: subcategoriesData == null
          ? []
          : subcategoriesData
                .map(
                  (e) => SubCategoryModel.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
    );
  }
}
