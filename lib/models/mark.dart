import 'package:kerwenli_yol/models/translation.dart';

class MarkModel {
  final String id, companyId, image;
  final TranslationModel businessName;

  MarkModel({
    required this.id,
    required this.companyId,
    required this.image,
    required this.businessName,
  });

  factory MarkModel.fromJson(Map<String, dynamic> json) {
    return MarkModel(
      id: json['uuid'] ?? '',
      companyId: json['company_uuid'] ?? '',
      image: json['company_logo_img'] ?? '',
      businessName: json['business_name'] == null
          ? TranslationModel.defaultValue()
          : TranslationModel.fromJson(json['business_name']),
    );
  }
}
