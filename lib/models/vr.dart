class VrModel {
  final String url;

  VrModel({required this.url});

  factory VrModel.fromJson(Map<String, dynamic> json) {
    return VrModel(url: json['url'] ?? '');
  }

  factory VrModel.defaultValue() {
    return VrModel(url: '');
  }
}
