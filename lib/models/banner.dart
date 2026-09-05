class BannerModel {
  final int orderNumber;
  final String url, imageTm, imageRu, imageEn, type, companyUuid;

  BannerModel({
    required this.orderNumber,
    required this.url,
    required this.imageTm,
    required this.imageRu,
    required this.imageEn,
    required this.type,
    this.companyUuid = '',
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      orderNumber: json['order_number'] ?? 0,
      url: json['url'] ?? '',
      imageTm: json['image_tm'] ?? '',
      imageRu: json['image_ru'] ?? '',
      imageEn: json['image_en'] ?? '',
      type: json['type_name'] ?? '',
      companyUuid: json['company_uuid'] ?? '',
    );
  }
}
