import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/weather.dart';

class WeatherApiService {
  Future<WeatherModel> getWeatherByCoordinates(double lat, double lon) async {
    final Uri uri = Uri.parse(weatherApiUrl).replace(
      queryParameters: {
        'lat': lat,
        'lon': lon,
        'appid': weatherApiKey,
        'units': 'metric',
        'lang': 'tr',
      },
    );

    print('============================= getWeatherByCoordinates');
    print('uri: $uri');

    try {
      final http.Response response = await http.get(uri);
      print('response.body: ${response.body}');
      final dynamic jsonData = json.decode(response.body);
      return WeatherModel.fromJson(jsonData);
    } catch (e) {
      print('error: ${e.toString()}');
      rethrow;
    }
  }
}
