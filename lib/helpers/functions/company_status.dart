import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/models/working_time.dart';

/// Текущий день недели на английском (как приходит в working_time.day.en)
String currentEnglishDayName([DateTime? now]) {
  const List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  final DateTime dt = now ?? DateTime.now();
  return days[dt.weekday - 1];
}

int _parseTime(String time) {
  // "09:00" → 540
  final List<String> parts = time.split(':');
  if (parts.length != 2) return 0;
  return (int.tryParse(parts[0]) ?? 0) * 60 + (int.tryParse(parts[1]) ?? 0);
}

bool _isNowBetween(String open, String close) {
  if (open.isEmpty || close.isEmpty) return false;
  final DateTime now = DateTime.now();
  final int nowMinutes = now.hour * 60 + now.minute;
  return nowMinutes >= _parseTime(open) && nowMinutes < _parseTime(close);
}

/// Для CompanyModel — используется в списках, поиске, вип-компаниях и т.д.
/// (company.workingTime — List<dynamic>, сырые Map из json)
bool computeIsOpen(CompanyModel company) {
  final String today = currentEnglishDayName();
  for (final dynamic wt in company.workingTime) {
    final String dayEn = (wt['day']?['en'] ?? '').toString().trim();
    if (dayEn.toLowerCase() == today.toLowerCase()) {
      return _isNowBetween(
        (wt['open'] ?? '').toString(),
        (wt['close'] ?? '').toString(),
      );
    }
  }
  return false; // сегодня выходной или нет данных
}

/// Для CompanyDetailModel — используется на странице компании
/// (company.workingTimes — List<WorkingTimeModel>, уже распарсенные модели)
bool computeIsOpenFromWorkingTimes(List<WorkingTimeModel> workingTimes) {
  final String today = currentEnglishDayName();
  for (final WorkingTimeModel wt in workingTimes) {
    if (wt.day.en.trim().toLowerCase() == today.toLowerCase()) {
      return _isNowBetween(wt.open, wt.close);
    }
  }
  return false;
}
