import 'package:clima_app/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

import '../../data/synoptic.dart';

class CityScreen extends StatefulWidget {
  final Synoptic synoptic;

  const CityScreen({required this.synoptic, super.key});

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? _cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: AppTextStyles.inputDecoration,
                  onChanged: (value) {
                   _cityName = value;
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, _cityName);
                },
                child: const Text(
                  'Get Weather',
                  style: AppTextStyles.button,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
