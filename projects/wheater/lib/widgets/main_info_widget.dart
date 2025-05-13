import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:wheater/bloc/weather_bloc.dart';
import 'package:wheater/theme/app_colors.dart';

class MainInfoWidget extends StatelessWidget {
  final WeatherState state;
  const MainInfoWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final weather = (state as WeatherSucesses).weather;

    /// Function used to determine the valid salute basd in the current hour
    /// Example:
    /// ```dart
    /// final greeting = _currentHour(); // 'Good Morning' (if before 12 PM)
    /// ```
    String determineSalute() {
      final int currentHour = DateTime.now().hour; // Gets current hour (0-23)

      if (currentHour < 12) {
        return 'Good Morning';
      } else if (currentHour >= 12 && currentHour < 18) {
        return 'Good Afternoon';
      } else {
        return 'Good Evening';
      }
    }

    Image determineWeatherImage(Weather weather) {
      final int code = weather.weatherConditionCode!;

      switch (code) {
        case >= 200 && < 300:
          return Image.asset('assets/main_imgs/1.png');
        case >= 300 && < 400:
          return Image.asset('assets/main_imgs/2.png');
        case >= 500 && < 600:
          return Image.asset('assets/main_imgs/3.png');
        case >= 600 && < 700:
          return Image.asset('assets/main_imgs/4.png');
        case >= 700 && < 800:
          return Image.asset('assets/main_imgs/5.png');
        case == 800:
          return Image.asset('assets/main_imgs/6.png');
        case > 800 && <= 804:
          return Image.asset('assets/main_imgs/7.png');
        default:
          return Image.asset('assets/main_imgs/7.png');
      }
    }

    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '📍 ${weather.areaName}',
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            determineSalute(),
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 16),

          Center(child: determineWeatherImage(weather)),

          Center(
            child: Text(
              '${weather.temperature!.celsius!.round()}ºC',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),

          Center(
            child: Text(
              weather.weatherMain!.toUpperCase(),
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),

          // const SizedBox(height: 4),
          Center(
            child: Text(
              DateFormat('EEEE dd •').add_jm().format(weather.date!),
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w200,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
