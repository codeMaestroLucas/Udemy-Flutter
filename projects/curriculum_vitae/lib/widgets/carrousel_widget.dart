import 'package:curriculum_vitae/data/socials_data.dart';
import 'package:curriculum_vitae/widgets/socials_widget.dart';
import 'package:flutter/material.dart';

class CarrouselWidget extends StatefulWidget {
  const CarrouselWidget({super.key});

  @override
  State<CarrouselWidget> createState() => _CarrouselWidgetState();
}

class _CarrouselWidgetState extends State<CarrouselWidget> {
  final data = SocialsData().data;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) => SocialsWidget(item: data[index]),
    );
  }
}
