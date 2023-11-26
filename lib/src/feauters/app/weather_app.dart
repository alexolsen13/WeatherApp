import 'package:flutter/material.dart';
import 'package:flutter_weather/src/feauters/weather/widgets/weather_screen.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: WeatherScreen(),);
  }
}