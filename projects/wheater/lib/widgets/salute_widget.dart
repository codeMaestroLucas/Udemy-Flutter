import 'package:flutter/material.dart';
import 'package:wheater/bloc/weather_bloc.dart';
import 'package:wheater/theme/app_colors.dart';

class SaluteWidget extends StatelessWidget {
  final WeatherState state;
  const SaluteWidget({super.key, required this.state});

  /// Function used to determine the valid salute basd in the current hour
  /// Example:
  /// ```dart
  /// final greeting = _currentHour(); // 'Good Morning' (if before 12 PM)
  /// ```
  String determineSalute() {
    final int currentHour = DateTime.now().hour; // Gets current hour (0-23)
    final String salute;

    if (currentHour < 12) {
      salute = 'Good Morning';
    } else if (currentHour >= 12 && currentHour < 18) {
      salute = 'Good Afternoon';
    } else {
      salute = 'Good Evening';
    }

    return salute;
  }

  @override
  Widget build(BuildContext context) {
    final weather = (state as WeatherSucesse).weather;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          '📍 ${weather.areaName}',
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w300),
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
      ],
    );
  }
}
