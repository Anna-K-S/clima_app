class WeatherMain {
  final double temperature;

  const WeatherMain({
    required this.temperature,
  });

  factory WeatherMain.fromJson(Map<String, dynamic> json){
    return WeatherMain(temperature: json['temp'] as double);
  }
}