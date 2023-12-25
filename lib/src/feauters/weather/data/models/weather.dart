//part "weather.g.dart";
import 'package:flutter_weather/src/feauters/weather/data/models/daily_weather.dart';
import 'package:flutter_weather/src/feauters/weather/data/models/to_condition_extention.dart';
import 'package:flutter_weather/src/feauters/weather/service/get_weather_image_service.dart';

enum TemperatureUnits {
  celsius,
  fahrenheit,
}

extension TemperatureUnitsX on TemperatureUnits {
  bool get isFahrenheit => this == TemperatureUnits.fahrenheit;
  bool get isCelsius => this == TemperatureUnits.celsius;
}

class Temperature {
  final double value;

  const Temperature({required this.value});

  factory Temperature.fromJson(double json) {
    return Temperature(value: json);
  }
}

enum WeatherCondition {
  clear,
  rainy,
  cloudy,
  snowy,
  foggy,
  unknown,
}

class Weather {
  final double temperature;
  final WeatherCondition condition;
  final String location;
  final double weatherCode;
  final Temperature temperatureEntity;
  final DailyWeather dailyWeather;

  const Weather(
      {required this.temperature,
      required this.condition,
      required this.location,
      required this.weatherCode,
      required this.temperatureEntity,
      required this.dailyWeather});

  // factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
  factory Weather.fromJson(Map<String, dynamic> json) {
    int weatherCode = json["weathercode"];
    final condition = toCondition(weatherCode);
    return Weather(
      temperature: json["temperature"],
      condition: condition,
      location: json["location"].toString(),
      weatherCode: weatherCode.toDouble(),
      temperatureEntity: Temperature.fromJson(json["temperature"]),
      dailyWeather: DailyWeather.fromJson(json["daily"]),
    );
  }

  get time => null;

  get iconCode => null;

  Weather copyWith(
      {double? temperature,
      WeatherCondition? condition,
      String? location,
      double? weatherCode,
      Temperature? temperatureEntity,
      DailyWeather? dailyWeather}) {
    return Weather(
      temperature: temperature ?? this.temperature,
      condition: condition ?? this.condition,
      location: location ?? this.location,
      weatherCode: weatherCode ?? this.weatherCode,
      temperatureEntity: temperatureEntity ?? this.temperatureEntity,
      dailyWeather: dailyWeather ?? this.dailyWeather,
    );
  }

  static getImage(WeatherCondition condition) {
    return getWeatherConditionImage(condition);
  }
}
