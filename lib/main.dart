
import 'package:clima_app/presentation/screen/loading_screen.dart';
import 'package:flutter/material.dart'; 

 
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