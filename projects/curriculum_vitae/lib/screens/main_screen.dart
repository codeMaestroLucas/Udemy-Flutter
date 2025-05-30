import 'package:curriculum_vitae/themes/app_colors.dart';
import 'package:curriculum_vitae/widgets/carrousel_widget.dart';
import 'package:curriculum_vitae/widgets/presentation_widget.dart';
import 'package:curriculum_vitae/widgets/t_appbar_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color currentBg = AppColors.black;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: TAppbarWidget(),
        body: Container(
          color: currentBg,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: PresentationWidget()),
                const SizedBox(height: 8),
                Expanded(flex: 2, child: CarrouselWidget()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
