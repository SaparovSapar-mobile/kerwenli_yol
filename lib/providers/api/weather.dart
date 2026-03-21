import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kerwenli_yol/models/weather.dart';
import 'package:kerwenli_yol/services/api/weather.dart';
import 'package:kerwenli_yol/services/location_service.dart';

final Provider<WeatherApiService> weatherApiProvider =
    Provider<WeatherApiService>((ref) => WeatherApiService());

final Provider<LocationService> locationServiceProvider =
    Provider<LocationService>((ref) {
      return LocationService();
    });

final FutureProvider<WeatherModel> weatherProvider =
    FutureProvider<WeatherModel>((ref) async {
      WeatherModel result = WeatherModel.defaultValue();
      print('----------------------------- weatherProvider');

      try {
        final LocationService locationService = ref.watch(
          locationServiceProvider,
        );
        final Position position = await locationService.getCurrentLocation();
        print('lat: ${position.latitude}');
        print('long: ${position.longitude}');

        result = await ref
            .read(weatherApiProvider)
            .getWeatherByCoordinates(position.latitude, position.longitude);
      } catch (e) {
        rethrow;
      }

      return result;
    });
