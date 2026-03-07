import 'package:kerwenli_yol/models/translation.dart';

class SponsorModel {
  final String id, companyId, companyLogoImg;
  final TranslationModel businessNames;

  SponsorModel({
    required this.id,
    required this.companyId,
    required this.companyLogoImg,
    required this.businessNames,
  });

  factory SponsorModel.defaultValue() {
    return SponsorModel(
      id: '',
      companyId: '',
      companyLogoImg: '',
      businessNames: TranslationModel.defaultValue(),
    );
  }

  factory SponsorModel.fromJson(Map<String, dynamic> json) {
    return SponsorModel(
      id: json['uuid'] ?? '',
      companyId: json['company_uuid'] ?? '',
      companyLogoImg: json['company_logo_img'] ?? '',
      businessNames: json['business_name'] == null
          ? TranslationModel.defaultValue()
          : TranslationModel.fromJson(json['business_name']),
    );
  }
}
