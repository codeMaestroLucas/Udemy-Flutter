import 'dart:math';

import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final double increaseSizeValue;
  final bool useHero;

  const Details({super.key, required this.increaseSizeValue, this.useHero = false});

  @override
  Widget build(BuildContext context) {
    Widget avatar = CircleAvatar(
      radius: max(75, 60 * increaseSizeValue),
      backgroundColor: const Color.fromARGB(218, 255, 255, 255),
      backgroundImage: Image.asset('assets/profile.png').image,
    );

    return Column(
      children: [
        useHero ? Hero(tag: 'profileHero', child: avatar) : avatar,
        const SizedBox(height: 8),
        Text(
          "Lucas Samuel",
          style: TextStyle(
            letterSpacing: -1,
            fontFamily: 'Karla',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: max(28, 20 * increaseSizeValue),
          ),
        ),
        Text(
          "Flutter Developer",
          style: TextStyle(
            fontFamily: 'Nunito',
            letterSpacing: 3,
            color: const Color.fromARGB(255, 229, 229, 229),
            fontWeight: FontWeight.w100,
            fontSize: max(16, 8 * increaseSizeValue),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(width: max(120, 70 * increaseSizeValue), child: Divider()),
        const SizedBox(height: 8),
      ],
    );
  }
}
