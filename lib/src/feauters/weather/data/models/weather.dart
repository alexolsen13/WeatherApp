//part "weather.g.dart";
enum TemperatureUnits{
  celsius,
  fahrenheit,
}

extension TemperatureUnitsX on TemperatureUnits{
  bool get isFahrenheit => this == TemperatureUnits.fahrenheit;
  bool get isCelsius => this == TemperatureUnits.celsius;
}

class Temperature{
  final double value;

  const Temperature({required this.value});

  factory Temperature.fromJson(double json) {
    return Temperature(value: json);
  }
}

enum WeatherCondition{
  clear,
  rainy,
  cloudy,
  snowy,
  unknown,
}



class Weather{
  final double temperature;
  final WeatherCondition condition;
  final String location;
  final double weatherCode;
  final Temperature temperatureEntity;

  const Weather({required this.temperature, required this.condition, required this.location, required this.weatherCode, required this.temperatureEntity});

  // factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
  factory Weather.fromJson(Map<String, dynamic> json) {
    int weatherCode = json["weathercode"];
    final condition = weatherCode.toCondition;
    return Weather(temperature: json["temperature"], condition: condition, location: json["temperature"].toString(), weatherCode: weatherCode.toDouble(), temperatureEntity: Temperature.fromJson(json["temperature"]));
  }

  Weather copyWith ({double? temperature,
WeatherCondition? condition,
String? location,
double? weatherCode,
Temperature? temperatureEntity}){
  return Weather(temperature: temperature ?? this.temperature, condition: condition ?? this.condition, location: location ?? this.location, weatherCode: weatherCode ?? this.weatherCode, temperatureEntity: temperatureEntity ?? this.temperatureEntity);
}
}
extension on int {
  WeatherCondition get toCondition {
    switch (this) {
      case 0:
        return WeatherCondition.clear;
      case 1:
      case 2:
      case 3:
      case 45:
      case 48:
        return WeatherCondition.cloudy;
      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
      case 80:
      case 81:
      case 82:
      case 95:
      case 96:
      case 99:
        return WeatherCondition.rainy;
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return WeatherCondition.snowy;
      default:
        return WeatherCondition.unknown;
    }
  }
}