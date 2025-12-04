import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/enums/theme.dart';
import 'package:kerwenli_yol/models/screen_property.dart';
import 'package:kerwenli_yol/providers/settings.dart';

bool isLightTheme(BuildContext context, WidgetRef ref) {
  int theme = ref.watch(themeProvider);
  Brightness brightness = MediaQuery.of(context).platformBrightness;
  if (theme == ThemeType.system) {
    return brightness == Brightness.light;
  }
  if (theme == ThemeType.white) {
    return true;
  }
  return false;
}

ScreenProperties screenProperties(BuildContext context) {
  ScreenProperties screenProperties = ScreenProperties(0, 0, 0);

  screenProperties.width = MediaQuery.of(context).size.width;
  screenProperties.height = MediaQuery.of(context).size.height;
  screenProperties.topSafeArea = MediaQuery.of(context).viewPadding.top;

  return screenProperties;
}
