import 'package:e_commerce/constraints.dart';
import 'package:flutter/material.dart';

class DetailsReviewsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> reviews;
  const DetailsReviewsWidget({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: reviews.map((review) => generateReview(review)).toList(),
    );
  }

  Widget generateReview(Map<String, dynamic> review) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: colorContent,
        borderRadius: BorderRadius.circular(4),
      ),
      
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _presentationContainer(review),
            ),
            const SizedBox(height: 12),
            Text(review['comment']),
          ],
        ),
      ),
    );
  }

  List<Widget> _presentationContainer(Map<String, dynamic> review) {
    return [
      CircleAvatar(
        maxRadius: 24,
        backgroundImage: AssetImage(review['profile_pic']),
      ),

      const SizedBox(width: 8),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(review['user'], style: TextStyle(fontWeight: FontWeight.bold)),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: colorPrimary.withAlpha(200),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Row(
                children: [
                  Icon(Icons.star, color: colorContent, size: 12),
                  const SizedBox(width: 4),
                  Text(
                    review['ratting'].toString(),
                    style: TextStyle(
                      color: colorContent,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ];
  }
}
