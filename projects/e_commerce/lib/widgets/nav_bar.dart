import 'package:e_commerce/constraints.dart';
import 'package:e_commerce/data/nav_bar_icon_data.dart';
import 'package:e_commerce/screens/cart/cart_screen.dart';
import 'package:e_commerce/screens/favorite/favorites_screen.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/screens/profile_screen.dart';
import 'package:e_commerce/widgets/nav_bar_icon_widget.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 2; // Home screen selected.

  final screens = const [
    Scaffold(),
    FavoritesScreen(),
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },

        backgroundColor: colorPrimary,
        shape: const CircleBorder(),

        child: Icon(
          Icons.home_rounded,
          size: sizeIcon + 4,
          color: colorContent,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: colorBottomAppBarBg,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _generateNavIcons(),
        ),
      ),

      body: screens[currentIndex],
    );
  }

  List<Widget> _generateNavIcons() {
    final navBarIcons = NavBarIconData().data;

    return [
      // Left side icons (before FAB space)
      NavBarIconWidget(
        iconModel: navBarIcons[0],
        currentIndex: currentIndex,
        onPressed: (index) => setState(() => currentIndex = index),
      ),
      NavBarIconWidget(
        iconModel: navBarIcons[1],
        currentIndex: currentIndex,
        onPressed: (index) => setState(() => currentIndex = index),
      ),

      // Empty space for FAB
      const SizedBox(width: 16),

      // Right side icons (after FAB space)
      NavBarIconWidget(
        iconModel: navBarIcons[2],
        currentIndex: currentIndex,
        onPressed: (index) => setState(() => currentIndex = index),
      ),
      NavBarIconWidget(
        iconModel: navBarIcons[3],
        currentIndex: currentIndex,
        onPressed: (index) => setState(() => currentIndex = index),
      ),
    ];
  }
}
