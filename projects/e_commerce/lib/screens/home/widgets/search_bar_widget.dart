import 'package:e_commerce/constraints.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  
  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorContent,
        borderRadius: BorderRadius.circular(borderSearchBar),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),

      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey.shade400, size: sizeIcon),

          const SizedBox(width: 12),
          Flexible(
            flex: 4,

            child: TextField(
              controller: controller, // To store the data
              onChanged: onChanged,   // Function to treat the data
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),

          // Just a stylized separator
          Container(height: 32, width: 2, color: Colors.grey),
          IconButton(
            onPressed: () {}, // Nothing to implement here
            icon: Icon(Icons.tune, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}