
import 'package:flutter/material.dart';
import 'loading_screen.dart';

void main() => runApp(const Clima());

class Clima extends StatelessWidget {
  const Clima({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const LoadingScreen(),
    );
  }                        
}