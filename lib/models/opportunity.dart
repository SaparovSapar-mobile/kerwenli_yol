class OpportunityModel {
  final List<dynamic> labels;

  OpportunityModel({required this.labels});

  factory OpportunityModel.fromJson(Map<String, dynamic> json) {
    return OpportunityModel(labels: json['labels'] ?? []);
  }

  factory OpportunityModel.defaultValue() {
    return OpportunityModel(labels: []);
  }
}
