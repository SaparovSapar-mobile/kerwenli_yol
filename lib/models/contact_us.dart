class ContactUsModel {
  final String addressTm, addressRu, addressEn;
  List<dynamic> phones, emails;

  ContactUsModel({
    required this.addressTm,
    required this.addressRu,
    required this.addressEn,
    required this.phones,
    required this.emails,
  });

  factory ContactUsModel.fromJson(Map<String, dynamic> json) {
    return ContactUsModel(
      addressTm: json['address_tm'],
      addressRu: json['address_ru'],
      addressEn: json['address_en'],
      phones: json['phones'] ?? [],
      emails: json['emails'] ?? [],
    );
  }

  factory ContactUsModel.defaultValue() {
    return ContactUsModel(
      addressTm: '',
      addressRu: '',
      addressEn: '',
      phones: [],
      emails: [],
    );
  }
}
