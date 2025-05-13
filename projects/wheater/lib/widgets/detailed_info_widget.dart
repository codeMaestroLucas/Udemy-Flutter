import 'package:flutter/material.dart';
import 'package:wheater/models/detailed_infos_model.dart';
import 'package:wheater/theme/app_colors.dart';

class DetailedInfoWidget extends StatelessWidget {
  final DetailedInfosModel item;
  final String details;

  const DetailedInfoWidget({super.key, required this.item, required this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      constraints: const BoxConstraints(maxWidth: 150),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(item.imagePath, scale: 10),
          const SizedBox(width: 4),
          Flexible(
            // Use Flexible to allow text to wrap
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.white,
                    fontWeight: FontWeight.w200,
                  ),
                  softWrap: true, // Ensure text wraps
                ),
                const SizedBox(height: 2),
                Text(
                  details,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  softWrap: true, // Ensure text wraps
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
