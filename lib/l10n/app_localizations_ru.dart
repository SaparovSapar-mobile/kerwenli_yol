// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get home => 'Главная';

  @override
  String get pleaseEnterTheInformationCompletelyAndCorrectly => 'Пожалуйста, введите информацию полностью и правильно.';

  @override
  String get iHaveReadTheRules => 'Я ознакомился с правилами';

  @override
  String get getToKnowTheRules => 'Ознакомьтесь с правилами';

  @override
  String get somethingWentWrong => 'Что-то пошло не так';
}
