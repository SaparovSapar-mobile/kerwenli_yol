import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TkMaterialLocalizations extends DefaultMaterialLocalizations {
  const TkMaterialLocalizations();

  static const LocalizationsDelegate<MaterialLocalizations> delegate =
      _TkMaterialLocalizationsDelegate();
}

class _TkMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const _TkMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'tk';

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      const TkMaterialLocalizations();

  @override
  bool shouldReload(_TkMaterialLocalizationsDelegate old) => false;
}

class TkCupertinoLocalizations extends DefaultCupertinoLocalizations {
  const TkCupertinoLocalizations();

  static const LocalizationsDelegate<CupertinoLocalizations> delegate =
      _TkCupertinoLocalizationsDelegate();
}

class _TkCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const _TkCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'tk';

  @override
  Future<CupertinoLocalizations> load(Locale locale) async =>
      const TkCupertinoLocalizations();

  @override
  bool shouldReload(_TkCupertinoLocalizationsDelegate old) => false;
}
