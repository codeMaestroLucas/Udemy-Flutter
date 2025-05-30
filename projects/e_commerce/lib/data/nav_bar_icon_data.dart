import 'package:e_commerce/models/nav_bar_icon_model.dart';
import 'package:flutter/material.dart';

class NavBarIconData {
  final data = [
    NavBarIconModel(
      icon: Icons.grid_view_outlined,
      index: 0,
    ),

    NavBarIconModel(
      icon: Icons.favorite_border,
      activeIcon: Icons.favorite,
      index: 1,
    ),

    NavBarIconModel(
      icon: Icons.shopping_cart_outlined,
      index: 3,
    ),

    NavBarIconModel(
      icon: Icons.person,
      index: 4,
    ),
  ];
}
