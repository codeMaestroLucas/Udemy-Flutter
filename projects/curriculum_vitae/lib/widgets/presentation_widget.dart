import 'package:curriculum_vitae/themes/app_colors.dart';
import 'package:flutter/material.dart';

class PresentationWidget extends StatelessWidget {
  const PresentationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CircleAvatar(
            radius: 70,
            backgroundColor: AppColors.white,
            foregroundImage: AssetImage('assets/images/profile_pic.png'),
          ),
        ),

        const SizedBox(height: 4),
        Text(
          'Lucas Samuel',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 4),
        Text(
          textAlign: TextAlign.center,
          'Backend Developer\nFlutter Developer',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w100,
          ),
        ),
      ],
    );
  }
}
