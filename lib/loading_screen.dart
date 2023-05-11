import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'location.dart';
import 'dart:convert';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const _basePath = 'api.openweathermap.org';
const _apiKey = '1a19e47cb55a68bff866d9332af29626';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late final _latitude;
  late final _longitude;

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
    Location location = Location();
    await location.getCurrentLocation();

    _latitude = location.latitude.toString();
    _longitude = location.longitude.toString();
    getData();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return const LocationScreen();
      }),
    );
  }

  Future<void> getData() async {
    http.Response response = await http.get(
      Uri.https(
        _basePath,
        'data/2.5/weather',
        {
          'lat': _latitude,
          'lon': _longitude,
          'appid': _apiKey,
        },
      ),
    );

    if (response.statusCode == 200) {
      final String data = response.body;
      return jsonDecode(data);
    }
  }
}


// double temperature = decodedData['main']['temp'];
// int condition = decodedData['weather'][0]['id'];
// String cityName =  decodedData['name'];