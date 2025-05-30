import 'package:e_commerce/constraints.dart';
import 'package:e_commerce/models/products_model.dart';
import 'package:e_commerce/providers/favorite_provider.dart';
import 'package:flutter/material.dart';

class DetailsAppBar extends StatefulWidget {
  final ProductsModel product;
  const DetailsAppBar({super.key, required this.product});

  @override
  State<DetailsAppBar> createState() => _DetailsAppBarState();
}

class _DetailsAppBarState extends State<DetailsAppBar> {
  @override
  Widget build(BuildContext context) {
    final FavoriteProvider provider = FavoriteProvider.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),

      child: Row(
        children: [
          // Arrow back Icon
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },

            style: IconButton.styleFrom(
              backgroundColor: colorBg,
              padding: EdgeInsets.all(8),
            ),
            icon: Icon(size: sizeIcon - 10, Icons.arrow_back_ios),
          ),

          Spacer(),
          // Share Icon
          IconButton(
            onPressed: () {},

            style: IconButton.styleFrom(
              backgroundColor: colorBg,
              padding: EdgeInsets.all(8),
            ),
            icon: Icon(
              size: sizeIcon - 4,
              Icons.share_outlined,
              color: Colors.black,
            ),
          ),

          // Favorite Icon
          const SizedBox(width: 12),
          IconButton(
            onPressed: () {
              setState(() {
                provider.toggleFavorite(widget.product);
              });
            },
            
            style: IconButton.styleFrom(
              backgroundColor: colorBg,
              padding: EdgeInsets.all(8),
            ),
            icon: Icon(
              provider.productInFavorite(widget.product)
                  ? Icons.favorite
                  : Icons.favorite_border,
              size: provider.productInFavorite(widget.product) ? 22 : 20,
              color:
                  provider.productInFavorite(widget.product)
                      ? colorPrimary
                      : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
