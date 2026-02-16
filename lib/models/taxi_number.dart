class TaxiNumberModel {
  final String phone;

  TaxiNumberModel({required this.phone});

  factory TaxiNumberModel.fromJson(Map<String, dynamic> json) {
    return TaxiNumberModel(phone: json['phone'] ?? '');
  }

  factory TaxiNumberModel.defaultValue() {
    return TaxiNumberModel(phone: '');
  }
}
