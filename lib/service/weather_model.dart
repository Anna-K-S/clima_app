class WeatherModel {
  String weatherIcon(int id) => id < 300
      ? '🌩'
      : id < 400
          ? '🌧'
          : id < 600
              ? '☔️'
              : id < 700
                  ? '☃️'
                  : id < 800
                      ? '🌫'
                      : id == 800
                          ? '☀️'
                          : id <= 804
                              ? '☁️'
                              : '🤷‍';

  String weatherMessage(double temp) => temp > 77
      ? 'It\'s 🍦 time'
      : temp > 68
          ? 'Time for shorts and 👕'
          : temp < 50
              ? 'You\'ll need 🧣 and 🧤'
              : 'Bring a 🧥 just in case';
}
