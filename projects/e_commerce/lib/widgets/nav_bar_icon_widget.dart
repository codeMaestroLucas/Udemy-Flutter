import 'package:e_commerce/constraints.dart';
import 'package:e_commerce/models/nav_bar_icon_model.dart';
import 'package:flutter/material.dart';

class NavBarIconWidget extends StatelessWidget {
  final NavBarIconModel iconModel;
  final int currentIndex;
  final ValueChanged<int> onPressed;

  const NavBarIconWidget({
    super.key,
    required this.iconModel,
    required this.currentIndex,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onPressed(iconModel.index),
      icon: Icon(
        iconModel.getIconForIndex(currentIndex),
        size: sizeIcon,
        color: iconModel.getColorForIndex(currentIndex),
      ),
    );
  }
}
