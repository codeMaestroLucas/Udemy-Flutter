import 'package:flutter/material.dart';

class ProductsModel {
  final String title;
  final String description;
  final String image;
  final int reviewsQtd;
  final List<Map<String, dynamic>> specifications;
  final List<Map<String, dynamic>> reviews;
  final String seller;
  final double price;
  final List<Color> colors;
  final List<String> categories;
  final double rate;
  int quantity;

  ProductsModel({
    required this.title,
    required this.description,
    required this.image,
    required this.reviewsQtd,
    required this.specifications,
    required this.reviews,
    required this.seller,
    required this.price,
    required this.colors,
    required this.categories,
    required this.rate,
    required this.quantity,
  });
}
