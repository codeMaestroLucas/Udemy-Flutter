import 'package:flutter/material.dart';

class DetailsDescriptionWidget extends StatelessWidget {
  final String description;
  const DetailsDescriptionWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Text(
        description,
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
    );
  }
}
