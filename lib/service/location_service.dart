import 'package:clima_app/data/location.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Location> get currentLocation async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );

      return Location(
          latitude: position.latitude, longitude: position.longitude);
    } catch (e) {
      debugPrint(e.toString());

      rethrow;
    }
  }
}
