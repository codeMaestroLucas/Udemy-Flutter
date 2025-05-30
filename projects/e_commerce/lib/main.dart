import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/providers/favorite_provider.dart';
import 'package:e_commerce/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce',
        home: NavBar(),
      ),
    );
  }
}
