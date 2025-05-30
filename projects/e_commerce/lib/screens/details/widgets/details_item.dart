import 'package:e_commerce/constraints.dart';
import 'package:e_commerce/models/products_model.dart';
import 'package:flutter/material.dart';

class DetailsItem extends StatefulWidget {
  final ProductsModel product;

  const DetailsItem({super.key, required this.product});

  @override
  State<DetailsItem> createState() => _DetailsItemState();
}

class _DetailsItemState extends State<DetailsItem> {
  int currentColor = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        // Product Title and Price
        Text(widget.product.title, style: txtHeading2),
        Text('\$${widget.product.price}', style: txtHeading1),


        // Ratting container
        const SizedBox(height: 4),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: colorPrimary,
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),

                child: Row(
                  children: [
                    Icon(Icons.star, color: colorContent, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      widget.product.rate.toString(),
                      style: TextStyle(
                        color: colorContent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 4),
            Text(
              '(${widget.product.reviewsQtd} Reviews)',
              style: TextStyle(color: colorLabel, fontSize: 12),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Container(), // Empty just to use the spaceBetween
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Seller: ', style: TextStyle(fontSize: 12)),
                  TextSpan(
                    text: widget.product.seller,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),

        // Colors Section
        const SizedBox(height: 8),
        Text('Color', style: txtHeading2),
        
        const SizedBox(height: 4),
        colorsRow(widget.product),
      ],
    );
  }

  Widget colorsRow(ProductsModel product) {
    return SizedBox(
      height: 50,

      child: ListView(
        scrollDirection: Axis.horizontal,

        children: List.generate(
          product.colors.length,
          
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                currentColor = index;
              });
            },

            child: Padding(
              padding: const EdgeInsets.only(right: 12),

              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: product.colors[index],
                  border: Border.all(
                    color:
                        currentColor == index ? Colors.black87 : Colors.black12,
                    width: 1.5,
                  ),
                ),

                child:
                    currentColor == index
                        ? Center(
                          
                          child: Container(
                            width: 5,
                            height: 5,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white54,
                            ),
                          ),
                        )
                        : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
