class PrivacyPolicyModel {
  final String descriptionTm, descriptionRu, descriptionEn, descriptionTr;

  PrivacyPolicyModel({
    required this.descriptionTm,
    required this.descriptionRu,
    required this.descriptionEn,
    required this.descriptionTr,
  });

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    return PrivacyPolicyModel(
      descriptionTm: json['description_tm'] ?? '',
      descriptionRu: json['description_ru'] ?? '',
      descriptionEn: json['description_en'] ?? '',
      descriptionTr: json['description_tr'] ?? '',
    );
  }

  factory PrivacyPolicyModel.defaultValue() {
    return PrivacyPolicyModel(
      descriptionTm: '',
      descriptionRu: '',
      descriptionEn: '',
      descriptionTr: '',
    );
  }
}
