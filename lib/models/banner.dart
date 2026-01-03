class BannerModel {
  final int orderNumber;
  final String url, imageTm, imageRu, imageEn;

  BannerModel({
    required this.orderNumber,
    required this.url,
    required this.imageTm,
    required this.imageRu,
    required this.imageEn,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      orderNumber: json['order_number'] ?? 0,
      url: json['url'] ?? '',
      imageTm: json['image_tm'] ?? '',
      imageRu: json['image_ru'] ?? '',
      imageEn: json['image_en'] ?? '',
    );
  }
}
