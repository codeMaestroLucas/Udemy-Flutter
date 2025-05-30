import 'package:wheater/models/detailed_infos_model.dart';

class DetailedInfoData {
  final data = [
    DetailedInfosModel(
      imagePath: 'assets/detailed_info_icons/sunrise.png',
      title: 'Sunrise',
    ),
    DetailedInfosModel(
      imagePath: 'assets/detailed_info_icons/sunset.png',
      title: 'Sunset',
    ),
    DetailedInfosModel(
      imagePath: 'assets/detailed_info_icons/max_temp.png',
      title: 'Max Temperature',
    ),
    DetailedInfosModel(
      imagePath: 'assets/detailed_info_icons/min_temp.png',
      title: 'Min Temperature',
    ),
  ];
}
