import 'package:flutter/material.dart';
import 'package:wheater/bloc/weather_bloc.dart';
import 'package:wheater/screens/landscape_screen.dart';
import 'package:wheater/screens/portrait_screen.dart';

class ResponsiveLayout extends StatelessWidget {
  final WeatherState state;
  const ResponsiveLayout({super.key, required this.state});

  static bool isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;


  @override
  Widget build(BuildContext context) {
    if (state is! WeatherSucesse) {
      return const Center(child: CircularProgressIndicator());
    }

    final successState = state as WeatherSucesse;

    if (isPortrait(context)) {
      return PortraitScreen(state: successState);
    } else {
      return LandscapeScreen(state: successState);
    }
  }
}
