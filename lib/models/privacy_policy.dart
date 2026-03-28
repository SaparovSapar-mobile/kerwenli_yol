class PrivacyPolicyModel {
  final String descriptionTm, descriptionRu, descriptionEn;

  PrivacyPolicyModel({
    required this.descriptionTm,
    required this.descriptionRu,
    required this.descriptionEn,
  });

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    return PrivacyPolicyModel(
      descriptionTm: json['description_tm'],
      descriptionRu: json['description_ru'],
      descriptionEn: json['description_en'],
    );
  }

  factory PrivacyPolicyModel.defaultValue() {
    return PrivacyPolicyModel(
      descriptionTm: '',
      descriptionRu: '',
      descriptionEn: '',
    );
  }
}
