import 'package:kerwenli_yol/models/sub_category.dart';
import 'package:kerwenli_yol/models/translation.dart';

/// "00:02:20" -> "02:20", "01:05:30" -> "1:05:30".
/// Часы отбрасываем, когда их нет - так короче и привычнее.
String _formatDuration(String raw) {
  final String v = raw.trim();
  if (v.isEmpty) return '';

  final List<String> parts = v.split(':');
  if (parts.length != 3) return v;

  final int hours = int.tryParse(parts[0]) ?? 0;
  if (hours == 0) return '${parts[1]}:${parts[2]}';

  return '$hours:${parts[1]}:${parts[2]}';
}

class MediaModel {
  final String id, coverImage, name, duration;
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
    this.duration = '',
    TranslationModel? categoryName,
    this.subcategories = const [],
  }) : categoryName = categoryName ?? TranslationModel.defaultValue();

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic>? subcategoriesData = json['subcategories'] as List?;

    // Длительность лежит только внутри video_items, отдельного поля нет.
    // Раньше её не читали вообще, и на всех карточках стояло "03:00".
    final List<dynamic>? videoItems = json['video_items'] as List?;
    String duration = '';
    if (videoItems != null && videoItems.isNotEmpty) {
      final dynamic first = videoItems.first;
      if (first is Map<String, dynamic>) {
        duration = _formatDuration(first['duration']?.toString() ?? '');
      }
    }

    return MediaModel(
      duration: duration,
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
