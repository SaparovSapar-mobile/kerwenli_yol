import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/models/weather.dart';

class WeatherApiService {
  static const String _apiKey = 'ace700fb8088d6d1f1f2f54c21eea966';
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<WeatherModel> getWeatherByCoordinates(double lat, double lon) async {
    final uri = Uri.parse(
      '$_baseUrl?lat=$lat&lon=$lon&appid=$_apiKey&units=metric',
    );
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Ошибка: ${response.statusCode}');
    }
  }
}