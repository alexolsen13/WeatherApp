import 'package:flutter_weather/src/feauters/weather/data/models/models.dart';

String getWeatherConditionImage(WeatherCondition condition) {
  // final weatherCode = weather.weatherCode.toInt();

  // if (weatherCode >= 10) {
  //   return weatherCode.toString();
  // } else if (weatherCode > 0) {
  //   return '0$weatherCode';
  // } else {
  //   return '01';
  // }

  switch (condition) {
    case WeatherCondition.clear:
      return 'https://openweathermap.org/img/wn/01d@2x.png';
    case WeatherCondition.rainy:
      return 'https://openweathermap.org/img/wn/09d@2x.png';
    case WeatherCondition.cloudy:
      return 'https://openweathermap.org/img/wn/03d.png';
    default:
      return 'https://openweathermap.org/img/wn/01d@2x.png';
  }
}
