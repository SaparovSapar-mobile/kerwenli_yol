import 'package:kerwenli_yol/models/translation.dart';

class WorkingTimeModel {
  final String open, close;
  final TranslationModel day;

  WorkingTimeModel({
    required this.day,
    required this.open,
    required this.close,
  });

  factory WorkingTimeModel.fromJson(Map<String, dynamic> json) {
    return WorkingTimeModel(
      day: json['day'] == null
          ? TranslationModel.defaultValue()
          : TranslationModel.fromJson(json['day']),
      open: json['open'] ?? '',
      close: json['close'] ?? '',
    );
  }

  factory WorkingTimeModel.defaultValue() {
    return WorkingTimeModel(
      day: TranslationModel.defaultValue(),
      open: '',
      close: '',
    );
  }
}
