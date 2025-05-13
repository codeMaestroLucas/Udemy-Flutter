import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wheater/bloc/weather_bloc.dart';
import 'package:wheater/data/detailed_info_data.dart';
import 'package:wheater/widgets/detailed_info_widget.dart';

class MoreInfoWidget extends StatelessWidget {
  final WeatherState state;

  const MoreInfoWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final weather = (state as WeatherSucesses).weather;
    final data = DetailedInfoData().data;

    // Helper function to safely format time
    String formatTime(DateTime? time) {
      return time != null 
          ? DateFormat.jm().format(time)
          : '--:--';
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: DetailedInfoWidget(
                item: data[0],
                details: formatTime(weather.sunrise),
              ),
            ),
            Expanded(
              child: DetailedInfoWidget(
                item: data[1],
                details: formatTime(weather.sunset),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: const Divider(color: Colors.grey, thickness: 0.5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: DetailedInfoWidget(
                item: data[2],
                details: '${weather.tempMax?.celsius?.round() ?? '--'}°C',
              ),
            ),
            Expanded(
              child: DetailedInfoWidget(
                item: data[3],
                details: '${weather.tempMin?.celsius?.round() ?? '--'}°C',
              ),
            ),
          ],
        ),
      ],
    );
  }
}