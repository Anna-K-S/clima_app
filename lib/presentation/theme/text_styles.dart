import 'package:flutter/material.dart';

class AppTextStyles {
  static const temperature = TextStyle(
    fontFamily: 'Ubuntu',
    fontSize: 100.0,
  );

  static const message = TextStyle(
    fontFamily: 'Ubuntu',
    fontSize: 60.0,
  );

  static const button = TextStyle(
    fontSize: 50.0,
    fontFamily: 'Ubuntu',
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const id = TextStyle(
    fontSize: 100.0,
  );

  static const inputDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      icon: Icon(
        Icons.location_city,
        color: Colors.white,
      ),
      hintText: 'Enter City Name',
      hintStyle: TextStyle(
        color: Colors.grey,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        borderSide: BorderSide.none,
      ));
}
