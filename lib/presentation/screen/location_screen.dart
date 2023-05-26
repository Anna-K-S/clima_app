import 'package:clima_app/service/weather_model.dart';
import 'package:clima_app/data/synoptic.dart';
import 'package:clima_app/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';
import '../../service/location_service.dart';
import '../../service/weather_api.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  final Synoptic synoptic;

  const LocationScreen({
    required this.synoptic,
    super.key,
  });

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final _weather = WeatherModel();
  final _api = const WeatherApi();
  final _locationService = LocationService();
  late var  _synoptic = widget.synoptic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      _locationService.currentLocation;
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final cityName = await Navigator.push<String>(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen(
                              synoptic: _synoptic,
                            );
                          },
                        ),
                      );
                      if (cityName == null) return;

                      final synoptic = await getCityLocation(cityName);
                      setState(() {
                        _synoptic = synoptic;
                      });
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${widget.synoptic.main.temperature.toInt()} °C',
                      style: AppTextStyles.temperature,
                    ),
                    Text(
                      _weather.weatherIcon(_synoptic.weathers.first.id),
                      style: AppTextStyles.button,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  '${_weather.weatherMessage(_synoptic.main.temperature)} in ${_synoptic.cityName}',
                  textAlign: TextAlign.right,
                  style: AppTextStyles.message,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Synoptic> getCityLocation(String cityName) async {
    final location = await _locationService.currentLocation;
    final synoptic = await _api.getCityWeather(
        latitude: location.latitude,
        longitude: location.longitude,
        cityName: cityName);
        return synoptic;
  }
}
