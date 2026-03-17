class AddCBookmark {
  final String userId, companyId;

  AddCBookmark({required this.userId, required this.companyId});

  Map<String, dynamic> toJson() {
    return {'user_uuid': userId, 'company_uuid': companyId};
  }
}
