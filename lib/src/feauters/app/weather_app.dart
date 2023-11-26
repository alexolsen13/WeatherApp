import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/src/feauters/weather/bloc/weather_bloc.dart';
import 'package:flutter_weather/src/feauters/weather/widgets/weather_screen.dart';


class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: BlocProvider(
        create: (context) => WeatherBloc(),
        child: const WeatherScreen(),
      ),
    );
  }
}
