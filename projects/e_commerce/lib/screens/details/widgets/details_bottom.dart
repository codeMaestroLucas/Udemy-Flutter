import 'package:e_commerce/constraints.dart';
import 'package:e_commerce/models/products_model.dart';
import 'package:e_commerce/screens/details/widgets/details_description_widget.dart';
import 'package:e_commerce/screens/details/widgets/details_reviews_widget.dart';
import 'package:e_commerce/screens/details/widgets/details_specifications_widget.dart';
import 'package:flutter/material.dart';

class DetailsBottom extends StatefulWidget {
  final ProductsModel product;
  const DetailsBottom({super.key, required this.product});

  @override
  State<DetailsBottom> createState() => _DetailsBottomState();
}

class _DetailsBottomState extends State<DetailsBottom> {
  int currentSection = 0;

  final List<String> sections = ['Description', 'Specifications', 'Reviews'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: List.generate(
            sections.length,
            (index) => _sectionHeadding(index, sections[index]),
          ),
        ),

        const SizedBox(height: 12),
        if (currentSection == 0)
          DetailsDescriptionWidget(description: widget.product.description)
        else if (currentSection == 1)
          DetailsSpecificationsWidget(
            specifications: widget.product.specifications,
          )
        else if (currentSection == 2)
          DetailsReviewsWidget(reviews: widget.product.reviews),
      ],
    );
  }

  Widget _sectionHeadding(int index, String sectionTitle) {
    final isSelected = currentSection == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentSection = index;
        });
      },

      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.only(right: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? colorPrimary : Colors.transparent,
        ),
        
        child: Text(
          sectionTitle,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isSelected ? colorContent : Colors.black,
          ),
        ),
      ),
    );
  }
}
