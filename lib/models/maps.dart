class MapsModel {
  final String url;

  MapsModel({required this.url});

  factory MapsModel.fromJson(Map<String, dynamic> json) {
    return MapsModel(url: json['url'] ?? '');
  }

  factory MapsModel.defaultValue() {
    return MapsModel(url: '');
  }
}
