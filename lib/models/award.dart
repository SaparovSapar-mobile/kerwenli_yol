class AwardModel {
  final String id, companyId, img, nameTm, nameRu, nameEn, nameTr;

  AwardModel({
    required this.id,
    required this.companyId,
    required this.img,
    required this.nameTm,
    required this.nameRu,
    required this.nameEn,
    required this.nameTr,
  });

  factory AwardModel.fromJson(Map<String, dynamic> json) {
    return AwardModel(
      id: json['uuid'] ?? '',
      companyId: json['company_uuid'] ?? '',
      img: json['img'] ?? '',
      nameTm: json['name_tm'] ?? '',
      nameRu: json['name_ru'] ?? '',
      nameEn: json['name_en'] ?? '',
      nameTr: json['name_tr'] ?? '',
    );
  }
}
