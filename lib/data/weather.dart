class Weather {
  final int id;
  final String main;
  final String description;

  const Weather({
    required this.description,
    required this.id,
    required this.main,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        description: json['description'] as String,
        id: json['id'] as int,
        main: json['main'] as String);
  }
}
