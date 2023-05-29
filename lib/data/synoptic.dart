import 'package:clima_app/data/weather.dart';
import 'package:clima_app/data/weather_main.dart';

class Synoptic {
  final WeatherMain main;
  final List<Weather> weathers;
  final String cityName;

  const Synoptic({
    required this.cityName,
    required this.main,
    required this.weathers,
  });

  factory Synoptic.fromJson(Map<String, dynamic> json) {
    final weathersJson = json['weather'] as List<dynamic>;

    return Synoptic(
      main: WeatherMain.fromJson(json['main'] as Map<String, dynamic>),
      cityName: json['name'] as String,
      weathers: weathersJson
          .map((json) => Weather.fromJson(json as Map<String, dynamic>))
          .toList(),
    );
  }
}
