class QrCodeModel {
  final String image, url;

  QrCodeModel({required this.image, required this.url});

  factory QrCodeModel.fromJson(Map<String, dynamic> json) {
    return QrCodeModel(image: json['image'] ?? '', url: json['url'] ?? '');
  }

  factory QrCodeModel.defaultValue() {
    return QrCodeModel(image: '', url: '');
  }
}
