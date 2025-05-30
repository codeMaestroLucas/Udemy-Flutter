import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:wheater/bloc/weather_bloc.dart';

class ImageWidget extends StatelessWidget {
  final WeatherState state;
  const ImageWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final weather = (state as WeatherSucesse).weather;

    Image determineWeatherImage(Weather weather) {
      final int code = weather.weatherConditionCode!;
      final String imageAsset;

      switch (code) {
        case >= 200 && < 300:
          imageAsset = 'assets/main_imgs/1.png';
        case >= 300 && < 400:
          imageAsset = 'assets/main_imgs/2.png';
        case >= 500 && < 600:
          imageAsset = 'assets/main_imgs/3.png';
        case >= 600 && < 700:
          imageAsset = 'assets/main_imgs/4.png';
        case >= 700 && < 800:
          imageAsset = 'assets/main_imgs/5.png';
        case == 800:
          imageAsset = 'assets/main_imgs/6.png';
        case > 800 && <= 804:
          imageAsset = 'assets/main_imgs/7.png';
        default:
          imageAsset = 'assets/main_imgs/7.png';
      }

      return Image.asset(imageAsset);
    }

    return Center(child: determineWeatherImage(weather));
  }
}
