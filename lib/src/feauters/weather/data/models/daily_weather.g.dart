// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyWeatherImpl _$$DailyWeatherImplFromJson(Map<String, dynamic> json) =>
    _$DailyWeatherImpl(
      temperature: (json['temperature_2m_max'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      condition: WeatherCodeConverter.fromJson(json['weather_code'] as List),
      date: (json['time'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
    );

Map<String, dynamic> _$$DailyWeatherImplToJson(_$DailyWeatherImpl instance) =>
    <String, dynamic>{
      'temperature_2m_max': instance.temperature,
      'weather_code':
          instance.condition.map((e) => _$WeatherConditionEnumMap[e]!).toList(),
      'time': instance.date.map((e) => e.toIso8601String()).toList(),
    };

const _$WeatherConditionEnumMap = {
  WeatherCondition.clear: 'clear',
  WeatherCondition.rainy: 'rainy',
  WeatherCondition.cloudy: 'cloudy',
  WeatherCondition.snowy: 'snowy',
  WeatherCondition.foggy: 'foggy',
  WeatherCondition.unknown: 'unknown',
};
