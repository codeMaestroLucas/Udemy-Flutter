// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FecthWeather>((event, emit) async {
      emit(WeatherLoading());

      try {
        final apiKey = dotenv.env['API_KEY']!;
        WeatherFactory wf = WeatherFactory(apiKey, language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByLocation(
          event.position.latitude,
          event.position.longitude,
        );
        emit(WeatherSucesses(weather));
      } catch (e) {
        emit(WeatherFailure());
      }
    });
  }
}
