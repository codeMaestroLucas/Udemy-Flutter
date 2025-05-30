import 'package:flutter/material.dart';

class DetailsSpecificationsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> specifications;
  const DetailsSpecificationsWidget({super.key, required this.specifications});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Table(
        border: TableBorder.all(
          borderRadius: BorderRadius.circular(4),
          color: Colors.black38,
        ),

        children:
            specifications.map((spec) {
              final key = spec.keys.first;
              final value = spec.values.first;

              return TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 8,
                    ),

                    child: Text(
                      key.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 8,
                    ),
                    
                    child: Text(value.toString(), textAlign: TextAlign.center),
                  ),
                ],
              );
            }).toList(),
      ),
    );
  }
}
