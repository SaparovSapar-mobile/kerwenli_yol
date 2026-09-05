class RateCompanyModel {
  final String companyId, userId;
  final double rating;

  RateCompanyModel({
    required this.companyId,
    required this.userId,
    required this.rating,
  });

  Map<String, dynamic> toJson() {
    return {
      'company_uuid': companyId,
      'user_uuid': userId,
      'rating': rating,
    };
  }
}
