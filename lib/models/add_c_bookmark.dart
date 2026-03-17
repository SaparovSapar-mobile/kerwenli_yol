class AddCBookmarkModel {
  final String userId, companyId;

  AddCBookmarkModel({required this.userId, required this.companyId});

  Map<String, dynamic> toJson() {
    return {'user_uuid': userId, 'company_uuid': companyId};
  }
}
