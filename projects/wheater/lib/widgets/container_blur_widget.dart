import 'package:flutter/material.dart';
import 'package:wheater/theme/app_colors.dart';

class ContainerBlurWidget extends StatelessWidget {
  final double posX;
  final double posY;
  final Color color;
  final double height;
  final double width;
  final bool sqareShape;

  const ContainerBlurWidget({
    super.key,
    required this.posX,
    required this.posY,
    required this.color,
    required this.height,
    required this.width,
    this.sqareShape = false,
  });

  /// Static method to return all 3 default blur blocks
  /// This function creates the shapes that will be used for the blur filter
  static List<Widget> defaultBlurBlocks() {
    return [
      ContainerBlurWidget(
        posX: 12,
        posY: -0.3,
        height: 300,
        width: 300,
        color: AppColors.purple,
        sqareShape: false,
      ),
      ContainerBlurWidget(
        posX: -12,
        posY: -0.3,
        height: 300,
        width: 300,
        color: AppColors.purple,
        sqareShape: false,
      ),
      ContainerBlurWidget(
        posX: 0,
        posY: -1.2,
        height: 300,
        width: 600,
        color: AppColors.amber,
        sqareShape: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(posX, posY),
      
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          shape: sqareShape ? BoxShape.rectangle : BoxShape.circle,
        ),
      ),
    );
  }
}
