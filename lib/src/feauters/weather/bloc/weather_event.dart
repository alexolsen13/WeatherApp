part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();



  @override
  List<Object> get props => [];
}

class WeatherFetchEvent extends WeatherEvent{
  final String query;
  const WeatherFetchEvent(this.query);



  @override
  List<Object> get props => [query];
}
