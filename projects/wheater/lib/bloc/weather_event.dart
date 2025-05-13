part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FecthWeather extends WeatherEvent {
  final Position position;

  const FecthWeather(this.position);

  @override
  List<Object> get props => [position];
}
