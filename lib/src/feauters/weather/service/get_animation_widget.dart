import 'package:flutter/widgets.dart';
import 'package:flutter_weather/src/feauters/weather/data/models/models.dart';
import 'package:weather_animation/weather_animation.dart';

Widget getAnimationWidget(WeatherCondition condition) {
  switch (condition) {
    case WeatherCondition.clear:
      return SunWidget();
    case WeatherCondition.rainy:
      return RainWidget();
    case WeatherCondition.cloudy:
      return CloudWidget();
    case WeatherCondition.snowy:
      return SnowWidget();
    default:
      return Placeholder(); // По умолчанию
  }
}
