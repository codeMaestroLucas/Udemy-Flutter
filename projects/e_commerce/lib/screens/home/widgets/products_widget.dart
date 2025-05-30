import 'package:e_commerce/constraints.dart';
import 'package:e_commerce/models/products_model.dart';
import 'package:e_commerce/providers/favorite_provider.dart';
import 'package:e_commerce/screens/details/details_screen.dart';
import 'package:flutter/material.dart';

class ProductsWidget extends StatefulWidget {
  final ProductsModel product;
  const ProductsWidget({super.key, required this.product});

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  @override
  Widget build(BuildContext context) {
    final FavoriteProvider provider = FavoriteProvider.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(product: widget.product),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colorContent,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // Product Image
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  alignment: Alignment.center,

                  child: Hero(
                    tag: widget.product.image,

                    child: Image.asset(
                      widget.product.image,
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Product Title with overflow protection
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),

                  child: Text(
                    widget.product.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                // Price and Color Indicators
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${widget.product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      // Color indicators
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,

                        children: List.generate(
                          widget.product.colors.length,
                          (index) => Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: widget.product.colors[index],
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color.fromARGB(25, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Rating and Reviews
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 8),

                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),

                      const SizedBox(width: 4),
                      Text(
                        '${widget.product.rate} (${widget.product.reviewsQtd})',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Favorite Product
          Positioned(
            child: Align(
              alignment: Alignment.topRight,

              child: AnimatedContainer(
                duration: Duration(microseconds: 700),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(10),
                  ),
                  color: colorPrimary.withAlpha(200),
                ),

                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      provider.toggleFavorite(widget.product);
                    });
                  },
                  
                  child: Icon(
                    provider.productInFavorite(widget.product) ? Icons.favorite : Icons.favorite_border,
                    size: provider.productInFavorite(widget.product) ? 22 : 20,
                    color: colorContent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
