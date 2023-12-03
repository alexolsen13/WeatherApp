part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class WeatherFetchEvent extends WeatherEvent {
  final Location location;
  const WeatherFetchEvent(this.location);

  @override
  List<Object> get props => [location];
}
