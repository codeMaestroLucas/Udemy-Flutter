import 'package:flutter/material.dart';
import 'package:wheater/bloc/weather_bloc.dart';
import 'package:wheater/widgets/image_widget.dart';
import 'package:wheater/widgets/more_info_widget.dart';
import 'package:wheater/widgets/salute_widget.dart';
import 'package:wheater/widgets/weather_main_info_widget.dart';

class LandscapeScreen extends StatelessWidget {
  final WeatherState state;
  const LandscapeScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SaluteWidget(state: state),
              const SizedBox(height: 32),
              MoreInfoWidget(state: state),
            ],
          ),
        ),

        Expanded(flex: 2, child: ImageWidget(state: state)),

        Expanded(flex: 1, child: WeatherMainInfoWidget(state: state)),
      ],
    );
  }
}
