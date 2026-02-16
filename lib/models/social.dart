class SocialModel {
  final String type, value;

  SocialModel({required this.type, required this.value});

  factory SocialModel.fromJson(Map<String, dynamic> json) {
    return SocialModel(type: json['type'] ?? '', value: json['value'] ?? '');
  }

  factory SocialModel.defaultValue() {
    return SocialModel(type: '', value: '');
  }
}
