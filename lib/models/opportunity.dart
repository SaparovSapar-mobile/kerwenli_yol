class OpportunityModel {
  final List<OpportunityTrModel> labels;

  OpportunityModel({required this.labels});

  factory OpportunityModel.fromJson(Map<String, dynamic> json) {
    return OpportunityModel(
      labels: json['labels'] == null || json['labels'] == []
          ? []
          : List<OpportunityTrModel>.from(
              json['labels'].map(
                (dataJson) => OpportunityTrModel.fromJson(dataJson),
              ),
            ),
    );
  }

  factory OpportunityModel.defaultValue() {
    return OpportunityModel(labels: []);
  }
}

class OpportunityTrModel {
  final String labelTm, labelRu, labelEn, opportunityIcon;

  OpportunityTrModel({
    required this.labelTm,
    required this.labelRu,
    required this.labelEn,
    this.opportunityIcon = '',
  });

  factory OpportunityTrModel.fromJson(Map<String, dynamic> json) {
    return OpportunityTrModel(
      labelTm: json['label_tm'] ?? '',
      labelRu: json['label_ru'] ?? '',
      labelEn: json['label_en'] ?? '',
      opportunityIcon: json['opportunity_icon'] ?? '',
    );
  }

  factory OpportunityTrModel.defaultValue() {
    return OpportunityTrModel(labelTm: '', labelRu: '', labelEn: '');
  }
}
