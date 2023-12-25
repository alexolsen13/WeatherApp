// ignore_for_file: invalid_annotation_target

import 'package:flutter_weather/src/feauters/weather/data/models/to_condition_extention.dart';
import 'package:flutter_weather/src/feauters/weather/data/models/weather.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_weather.freezed.dart';
part 'daily_weather.g.dart';

@freezed
class DailyWeather with _$DailyWeather {
  const factory DailyWeather({
    @JsonKey(name: 'temperature_2m_max') required List<double> temperature,
    @JsonKey(fromJson: WeatherCodeConverter.fromJson, name: 'weather_code')
    required List<WeatherCondition> condition,
    @JsonKey(name: 'time') required List<DateTime> date,
  }) = _DailyWeather;

  factory DailyWeather.fromJson(Map<String, dynamic> json) =>
      _$DailyWeatherFromJson(json);
}

class WeatherCodeConverter {
  static List<WeatherCondition> fromJson(List<dynamic> json) {
    List<WeatherCondition> list = [];
    for (final item in json) {
      list.add(toCondition(item));
    }
    return list;
  }
}
