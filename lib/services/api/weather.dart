import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/models/weather.dart';

class WeatherApiService {
  static const String _baseUrl = 'https://api.open-meteo.com/v1/forecast';

  Future<WeatherModel> getWeatherByCoordinates(double lat, double lon) async {
    final uri = Uri.parse(
      '$_baseUrl?latitude=$lat&longitude=$lon'
      '&current=temperature_2m,relative_humidity_2m,apparent_temperature,weather_code,wind_speed_10m,is_day'
      '&timezone=auto',
    );
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Ошибка: ${response.statusCode}');
    }
  }
}
