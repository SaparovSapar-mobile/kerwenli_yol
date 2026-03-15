class PublicationModel {
  final String id, nameTm, nameRu, nameEn;

  PublicationModel({
    required this.id,
    required this.nameTm,
    required this.nameRu,
    required this.nameEn,
  });

  factory PublicationModel.fromJson(Map<String, dynamic> json) {
    return PublicationModel(
      id: json['uuid'] ?? '',
      nameTm: json['name_tm'] ?? '',
      nameRu: json['name_ru'] ?? '',
      nameEn: json['name_en'] ?? '',
    );
  }

  factory PublicationModel.defaultValue() {
    return PublicationModel(id: '', nameTm: '', nameRu: '', nameEn: '');
  }
}
