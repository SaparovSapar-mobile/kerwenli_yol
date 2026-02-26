class MediaModel {
  final String id;
  final List<dynamic> videoPaths;
  final int viewNumber;

  MediaModel({
    required this.id,
    required this.videoPaths,
    required this.viewNumber,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
      id: json['uuid'] ?? '',
      viewNumber: json['video_paths'] ?? 0,
      videoPaths: json['banners'] ?? [],
    );
  }
}
