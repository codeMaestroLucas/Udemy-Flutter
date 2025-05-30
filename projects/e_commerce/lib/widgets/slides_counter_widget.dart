import 'package:flutter/material.dart';

class SlidesCounterWidget extends StatelessWidget {
  final int currentSlide;

  const SlidesCounterWidget({super.key, required this.currentSlide});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => AnimatedContainer(
          width: currentSlide == index ? 16 : 8,
          height: 4,
          margin: EdgeInsets.only(right: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: currentSlide == index ? Colors.black : Colors.transparent,
            border: Border.all(color: Colors.black),
          ),
          duration: Duration(microseconds: 300),
        ),
      ),
    );
  }
}
