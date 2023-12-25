import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather/src/feauters/weather/data/models/location.dart';
import 'package:flutter_weather/src/feauters/weather/data/models/weather.dart';
import 'package:flutter_weather/src/feauters/weather/data/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) {});

    on<WeatherFetchEvent>((event, emit) async {
      emit(WeatherLoading());
      try {
        final weather = await WeatherRepository().getWeather(event.location);
        emit(WeatherLoaded(weatherData: weather, location: event.location));
      } catch (error, stackTrace) {
        emit(WeatherError(error: "$error, $stackTrace"));
      }
    });
  }
}
