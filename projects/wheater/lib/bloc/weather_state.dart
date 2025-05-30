part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherFailure extends WeatherState {}

final class WeatherSucesse extends WeatherState {
  final Weather weather;

  const WeatherSucesse(this.weather);

  @override
  List<Object> get props => [weather];
}
