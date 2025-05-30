import 'package:e_commerce/constraints.dart';
import 'package:flutter/material.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        // Menu Icon
        IconButton(
          onPressed: () {},

          style: IconButton.styleFrom(
            backgroundColor: colorContent,
            padding: const EdgeInsets.all(paddingScreens),
          ),
          icon: Icon(size: sizeIcon, Icons.menu_open),
        ),

        // Notification Icon
        IconButton(
          onPressed: () {},
          
          style: IconButton.styleFrom(
            backgroundColor: colorContent,
            padding: const EdgeInsets.all(paddingScreens),
          ),
          icon: Icon(size: sizeIcon, Icons.notifications_outlined),
        ),
      ],
    );
  }
}
