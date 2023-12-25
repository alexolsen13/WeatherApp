part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherLoaded extends WeatherState {
  final Weather weatherData;
  final Location location;

  const WeatherLoaded({required this.weatherData, required this.location});
  @override
  List<Object> get props => [weatherData, location];
}

final class WeatherError extends WeatherState {
  final String error;

  const WeatherError({required this.error});
  @override
  List<Object> get props => [error];
}
