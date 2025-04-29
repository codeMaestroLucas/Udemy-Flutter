import 'package:curriculum/avatar_profile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Details(increaseSizeValue: 1, useHero: true),
        
],
      ),
    );
  }
}
