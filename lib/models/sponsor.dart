class SponsorModel {
  final String id, companyId, companyLogoImg;
  final List<dynamic> businessNames;

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
      businessNames: [],
    );
  }

  factory SponsorModel.fromJson(Map<String, dynamic> json) {
    return SponsorModel(
      id: json['uuid'] ?? '',
      companyId: json['company_uuid'] ?? '',
      companyLogoImg: json['company_logo_img'] ?? '',
      businessNames: json['business_name'] ?? [],
    );
  }
}
