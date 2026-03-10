class MarkTypeModel {
  final String id, nameTm, nameRu, nameEn;

  MarkTypeModel({
    required this.id,
    required this.nameTm,
    required this.nameRu,
    required this.nameEn,
  });

  factory MarkTypeModel.fromJson(Map<String, dynamic> json) {
    return MarkTypeModel(
      id: json['uuid'] ?? '',
      nameTm: json['name_tm'] ?? '',
      nameRu: json['name_ru'] ?? '',
      nameEn: json['name_en'] ?? '',
    );
  }
}
