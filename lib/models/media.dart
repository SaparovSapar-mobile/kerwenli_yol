class MediaModel {
  final String id, coverImage;
  final List<dynamic> videoPaths;
  final int viewNumber;

  MediaModel({
    required this.id,
    required this.coverImage,
    required this.videoPaths,
    required this.viewNumber,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
      id: json['uuid'] ?? '',
      coverImage: json['cover_image'] ?? '',
      viewNumber: json['view_number'] ?? 0,
      videoPaths: json['video_paths'] ?? [],
    );
  }
}
