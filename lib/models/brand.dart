class BrandModel {
  final String id, individualUuid, logoImg, nameTm, nameRu, nameEn, nameTr;

  BrandModel({
    required this.id,
    required this.individualUuid,
    required this.logoImg,
    required this.nameTm,
    required this.nameRu,
    required this.nameEn,
    required this.nameTr,
  });

  factory BrandModel.fromJson(dynamic json) {
    // Backend may return a brand either as a plain name string
    // or as a full brand object — handle both.
    if (json is String) {
      return BrandModel(
        id: '',
        individualUuid: '',
        logoImg: '',
        nameTm: json,
        nameRu: json,
        nameEn: json,
        nameTr: json,
      );
    }

    final Map<String, dynamic> data = json as Map<String, dynamic>;
    return BrandModel(
      id: data['uuid'] ?? '',
      individualUuid: data['individual_uuid'] ?? '',
      logoImg: data['logo_img'] ?? '',
      nameTm: data['name_tm'] ?? '',
      nameRu: data['name_ru'] ?? '',
      nameEn: data['name_en'] ?? '',
      nameTr: data['name_tr'] ?? '',
    );
  }
}
