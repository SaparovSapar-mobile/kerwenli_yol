import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';

/// Планшетом считаем экран, у которого меньшая сторона от 600 dp -
/// это стандартный порог Android для планшетных ресурсов (sw600dp).
/// Меряем именно меньшую сторону, чтобы телефон в альбомной ориентации
/// не считался планшетом.
bool isTablet(BuildContext context) =>
    MediaQuery.sizeOf(context).shortestSide >= 600;

/// Насколько увеличиваем баннеры на планшете.
/// На широком экране прежняя высота выглядит узкой полосой.
const double _tabletBannerScale = 2.7;

/// Высота большого баннера (верхний, во всю ширину).
double bannerHeight1(BuildContext context) =>
    isTablet(context) ? banner1Height * _tabletBannerScale : banner1Height;

/// Высота двух маленьких баннеров в ряд.
double bannerHeight2(BuildContext context) =>
    isTablet(context) ? banner2Height * _tabletBannerScale : banner2Height;
