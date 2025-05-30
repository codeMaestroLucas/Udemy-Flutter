import 'package:e_commerce/widgets/slides_counter_widget.dart';
import 'package:flutter/material.dart';

class HomeImageSlider extends StatelessWidget {
  final Function(int) onChange;
  final int currentSlide;

  const HomeImageSlider({
    super.key,
    required this.onChange,
    required this.currentSlide,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 220,
          width: double.infinity,

          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: PageView(
              onPageChanged: onChange,
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              physics: ClampingScrollPhysics(),

              children: [
                Image.asset(
                  'assets/images/slider/slider1.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/slider/slider2.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/slider/slider3.jpg',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),

        Positioned.fill(
          bottom: 4,
          child: Align(
            alignment: Alignment.bottomCenter,
            
            child: SlidesCounterWidget(currentSlide: currentSlide),
          ),
        ),
      ],
    );
  }
}
