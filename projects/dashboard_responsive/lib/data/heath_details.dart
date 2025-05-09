import 'package:dashboard_responsive/models/health_model.dart';

class HeathDetails {
  final heathData = const [
    HealthModel(
      icon: 'assets/icons/burn.png',
      value: '305',
      title: 'Calories burned',
    ),
    HealthModel(
      icon: 'assets/icons/steps.png',
      value: '10,983',
      title: 'Steps',
    ),
    HealthModel(
      icon: 'assets/icons/distance.png',
      value: '7km',
      title: 'Distance',
    ),
    HealthModel(
      icon: 'assets/icons/sleep.png',
      value: '7h49min',
      title: 'Sleep',
    ),
  ];
}
