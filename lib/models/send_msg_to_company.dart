class SendMsgToCompanyModel {
  final String companyId, contactType, senderContact, text;

  SendMsgToCompanyModel({
    required this.companyId,
    required this.contactType,
    required this.senderContact,
    required this.text,
  });

  Map<String, dynamic> toJson() {
    return {
      'company_uuid': companyId,
      'contact_type': contactType,
      'sender_contact': senderContact,
      'text': text,
    };
  }
}
