import 'package:clima_app/data/synoptic.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


const _basePath = 'api.openweathermap.org';
const _apiKey = '1a19e47cb55a68bff866d9332af29626';
const _units = 'metric';



class WeatherApi {
  const WeatherApi();

  Future<Synoptic> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    http.Response response = await http.get(
      Uri.https(
        _basePath,
        'data/2.5/weather',
        { 
          'lat': latitude.toString(),
          'lon': longitude.toString(),
          'appid': _apiKey,
          'units': _units,
        },
      ),
    );

    if (response.statusCode != 200) throw Exception('no weather boi');

    final rawJson = response.body;

    final json = jsonDecode(rawJson) as Map<String, dynamic>;

    final result = Synoptic.fromJson(json);

    return result;
  }

  Future<Synoptic> getCityWeather({
    required double latitude,
    required double longitude,
    required String cityName,
  }) async {
    http.Response response = await http.get(
      Uri.https(
        _basePath,
        'data/2.5/weather',
        
        {
          'q' : cityName,
          'lat': latitude.toString(),
          'lon': longitude.toString(),
          'appid': _apiKey,
          'units': _units,
        },
      ),
    );

    if (response.statusCode != 200) throw Exception('no weather boi');

    final rawJson = response.body;

    final json = jsonDecode(rawJson) as Map<String, dynamic>;

    final result = Synoptic.fromJson(json);

    return result;
  }
}
