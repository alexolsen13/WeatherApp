import 'dart:async';
import 'dart:convert';
import 'package:flutter_weather/src/feauters/weather/data/models/models.dart';
import 'package:http/http.dart' as http;

/// Исключение, выбрасываемое при ошибке запроса локации.
class LocationRequestFailure implements Exception {}

/// Исключение, выбрасываемое при отсутствии указанной локации.
class LocationNotFoundFailure implements Exception {}

/// Исключение, выбрасываемое при ошибке запроса погоды.
class WeatherRequestFailure implements Exception {}

/// Исключение, выбрасываемое при отсутствии данных о погоде для указанной локации.
class WeatherNotFoundFailure implements Exception {}

/// Dart API клиент, обращающийся к Open Meteo API.
class OpenMeteoApiClient {
  final http.Client _httpClient;

  /// Базовый URL для данных о погоде.
  static const _baseUrlWeather = 'api.open-meteo.com';
  /// Базовый URL для геокодирования.
  static const _baseUrlGeocoding = 'geocoding-api.open-meteo.com';

  /// Конструктор для [OpenMeteoApiClient].
  OpenMeteoApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  /// Поиск локаций по запросу.
  Future<List<Location>> locationSearch(String query) async {
    final locationRequest = Uri.https(
      _baseUrlGeocoding,
      '/v1/search',
      {'name': query, 'count': '30'},
    );

    final locationResponse = await _httpClient.get(locationRequest);

    // Проверка успешности запроса локации.
    if (locationResponse.statusCode != 200) {
      throw LocationRequestFailure();
    }

    // Декодирование JSON-ответа, полученного после успешного запроса.
    final locationJson = jsonDecode(locationResponse.body) as Map;

    // Проверка наличия ключа 'results' в полученных данных.
    if (!locationJson.containsKey('results')) throw LocationNotFoundFailure();

    // Получение списка результатов поиска из JSON и их обработка.
    final results = locationJson['results'] as List;

    // Проверка наличия результатов поиска.
    if (results.isEmpty) throw LocationNotFoundFailure();

    // Преобразование JSON-объектов в список объектов Location и их возврат.
    return results.map((json) => Location.fromJson(json)).toList();
  }

  /// Получение данных о погоде для указанной локации.
  Future<Weather> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    final weatherRequest = Uri.https(_baseUrlWeather, 'v1/forecast', {
      'latitude': '$latitude',
      'longitude': '$longitude',
      'current_weather': 'true',
    });

    final weatherResponse = await _httpClient.get(weatherRequest);

    // Проверка успешности запроса погоды.
    if (weatherResponse.statusCode != 200) {
      throw WeatherRequestFailure();
    }

    // Декодирование JSON-ответа о погоде.
    final bodyJson = jsonDecode(weatherResponse.body) as Map<String, dynamic>;

    // Проверка наличия ключа 'current_weather' в полученных данных.
    if (!bodyJson.containsKey('current_weather')) {
      throw WeatherNotFoundFailure();
    }

    // Получение данных о погоде из JSON и их возврат.
    final weatherJson = bodyJson['current_weather'] as Map<String, dynamic>;

    return Weather.fromJson(weatherJson);
  }
}
