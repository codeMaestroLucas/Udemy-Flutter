import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wheater/bloc/weather_bloc.dart';
import 'package:wheater/theme/app_colors.dart';

class WeatherMainInfoWidget extends StatelessWidget {
  final WeatherState state;

  const WeatherMainInfoWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final weather = (state as WeatherSucesse).weather;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Text(
          '${weather.temperature!.celsius!.round()}ºC',
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),

        Text(
          weather.weatherMain!.toUpperCase(),
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),

        Text(
          DateFormat('EEEE dd •').add_jm().format(weather.date!),
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w200,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
