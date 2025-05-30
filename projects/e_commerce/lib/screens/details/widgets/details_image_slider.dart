import 'package:flutter/material.dart';

class DetailsImageSlider extends StatelessWidget {
  final Function(int) onChange;
  final String image;
  final int maxSlide;

  const DetailsImageSlider({
    super.key,
    required this.onChange,
    required this.image,
    this.maxSlide = 4,
    // Default to 4 (0-4 for 5 slides)
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        onPageChanged: (index) {
          if (index <= maxSlide) {
            onChange(index);
          }
        },
        itemCount: maxSlide + 1, // This limits the number of slides
        itemBuilder: (context, index) {
          return Hero(
            tag: image,
            child: Image.asset(image));
        },
      ),
    );
  }
}