class CompanyModel {
  final String uuid, individualUuid, photo, nameTm, nameRu, nameEn;

  CompanyModel({
    required this.uuid,
    required this.individualUuid,
    required this.photo,
    required this.nameTm,
    required this.nameRu,
    required this.nameEn,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      uuid: json['uuid'],
      individualUuid: json['individual_uuid'],
      photo: json['photo'] ?? '',
      nameTm: json['name_tm'] ?? '',
      nameRu: json['name_ru'] ?? '',
      nameEn: json['name_en'] ?? '',
    );
  }
}
