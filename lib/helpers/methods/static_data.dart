import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';

final String apiUrl = dotenv.env['API_URL']!;
final String pathUrl = dotenv.env['PATH_URL']!;
final String weatherApiKey = dotenv.env['WEATHER_API_KEY']!;
final String weatherApiUrl = dotenv.env['WEATHER_API_URL']!;

const double companyCardHeight = 292;
const double companyListCardHeight = 132;

const double productListCardHeight = 127;
const double productCardHeight = 295;

const double mediaCardHeight = 238;
const double photosCardHeight = 113;
const double wideoCardHeight = 151;

const double leaderCompanyCardHeight = 100;

const double newsListCardHeight = 103;

const double vipCompanyCardHeight = 202;

const double userProfileInfoCardHeight = 90;

const double homeCategoriesCardHeight = 48;
const double homeBestCompaniesCardHeight = 84;

const double banner1Height = 122;
const double banner2Height = 64;

const String notificationTopic = "trading_channel";

const pageSize = 10;

const mediaCardImageHeight = 202.0;
const homeSponsorsHeight = 56.0;
const homeSponsorsWidth = 170.0;

const homeGratutitudesHeight = 110.0;
const homeGratutitudeWidth = 190.0;

const homeMarkTypeHeight = 44.0;

const vipCompanyCardWidth = 112.0;

List<String> bookmarkHeaders(BuildContext context) {
  final AppLocalizations lang = AppLocalizations.of(context)!;

  return ['Likelar', lang.bookmark, 'Follow Firmalar'];
}

List<String> searchTabs(BuildContext context) {
  final AppLocalizations lang = AppLocalizations.of(context)!;

  return [lang.products, 'Firmalar', lang.news, 'Markalar', 'Medialar'];
}
