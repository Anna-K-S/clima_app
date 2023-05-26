import 'package:clima_app/service/location_service.dart';
import 'package:clima_app/service/weather_api.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final _api = const WeatherApi();
  final _locationService = LocationService();

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }

  Future<void> getLocation() async {
    final navigator = Navigator.of(context);
    final location = await _locationService.currentLocation;
    final synoptic = await _api.getWeather(
      latitude: location.latitude,
      longitude: location.longitude,
    );

    navigator.push(
      MaterialPageRoute(builder: (context) {
        return LocationScreen(synoptic: synoptic, );
      }),
    );
  }
}
