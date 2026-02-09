class AboutUsModel {
  final String nameTm,
      nameRu,
      nameEn,
      descriptionTm,
      descriptionRu,
      descriptionEn,
      basePhoto;
  List<dynamic> photos;

  AboutUsModel({
    required this.nameTm,
    required this.nameRu,
    required this.nameEn,
    required this.descriptionTm,
    required this.descriptionRu,
    required this.descriptionEn,
    required this.basePhoto,
    required this.photos,
  });

  factory AboutUsModel.fromJson(Map<String, dynamic> json) {
    return AboutUsModel(
      nameTm: json['name_tm'],
      nameRu: json['name_ru'],
      nameEn: json['name_en'],
      descriptionTm: json['description_tm'],
      descriptionRu: json['description_ru'],
      descriptionEn: json['description_en'],
      basePhoto: json['base_photo'],
      photos: json['photos'] ?? [],
    );
  }

  factory AboutUsModel.defaultValue() {
    return AboutUsModel(
      nameTm: '',
      nameRu: '',
      nameEn: '',
      descriptionTm: '',
      descriptionRu: '',
      descriptionEn: '',
      basePhoto: '',
      photos: [],
    );
  }
}
