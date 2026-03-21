import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    // final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // print('serviceEnabled: $serviceEnabled');

    // if (!serviceEnabled) {
    //   throw Exception('Konum servisi kapalı. Lütfen GPS açın.');
    // }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        throw Exception('Konum izni reddedildi.');
      }
    }

    final Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.best),
    );

    return position;
  }
}
