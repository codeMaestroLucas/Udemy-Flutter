import 'package:flutter/material.dart';
import 'package:wheater/bloc/weather_bloc.dart';
import 'package:wheater/widgets/image_widget.dart';
import 'package:wheater/widgets/more_info_widget.dart';
import 'package:wheater/widgets/salute_widget.dart';
import 'package:wheater/widgets/weather_main_info_widget.dart';

class PortraitScreen extends StatelessWidget {
  final WeatherState state;
  const PortraitScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const SizedBox(height: 8),
        SaluteWidget(state: state),

        Expanded(flex: 2, child: ImageWidget(state: state)),

        Center(child: WeatherMainInfoWidget(state: state)),

        const SizedBox(height: 52),
        MoreInfoWidget(state: state),
        const SizedBox(height: 20),
      ],
    );
  }
}
