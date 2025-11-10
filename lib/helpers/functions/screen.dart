import 'package:flutter/material.dart';
import 'package:kerwenli_yol/models/screen_property.dart';

ScreenProperties screenProperties(BuildContext context) {
  ScreenProperties screenProperties = ScreenProperties(0, 0, 0);

  screenProperties.width = MediaQuery.of(context).size.width;
  screenProperties.height = MediaQuery.of(context).size.height;
  screenProperties.topSafeArea = MediaQuery.of(context).viewPadding.top;

  return screenProperties;
}
