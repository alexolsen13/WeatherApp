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

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(value: json["value"]);
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
    return Weather(temperature: json["temperature"], condition: json["condition"], location: json["location"], weatherCode: json["weatherCode"], temperatureEntity: Temperature.fromJson(json["temperature"]));
  }

  Weather copyWith ({double? temperature,
WeatherCondition? condition,
String? location,
double? weatherCode,
Temperature? temperatureEntity}){
  return Weather(temperature: temperature ?? this.temperature, condition: condition ?? this.condition, location: location ?? this.location, weatherCode: weatherCode ?? this.weatherCode, temperatureEntity: temperatureEntity ?? this.temperatureEntity);
}
}