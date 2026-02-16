class WorkingTimeModel {
  final String day, open, close;

  WorkingTimeModel({
    required this.day,
    required this.open,
    required this.close,
  });

  factory WorkingTimeModel.fromJson(Map<String, dynamic> json) {
    return WorkingTimeModel(
      day: json['day'] ?? '',
      open: json['open'] ?? '',
      close: json['close'] ?? '',
    );
  }

  factory WorkingTimeModel.defaultValue() {
    return WorkingTimeModel(day: '', open: '', close: '');
  }
}
