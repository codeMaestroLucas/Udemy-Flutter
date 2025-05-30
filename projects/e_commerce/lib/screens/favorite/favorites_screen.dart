import 'package:e_commerce/constraints.dart';
import 'package:e_commerce/models/products_model.dart';
import 'package:e_commerce/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: colorContent,
        appBar: AppBar(
          title: Text(
            'Favorites',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),

        body: Column(
          children: [
            // Favorite List
            Expanded(
              flex: 3,
              child: Consumer<FavoriteProvider>(
                builder: (context, provider, _) {
                  final favoriteList = provider.favorites;

                  if (favoriteList.isEmpty) {
                    return SingleChildScrollView(
                      //* Allows the widget to overflow without displaying warnings
                      physics: NeverScrollableScrollPhysics(),

                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 150),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/empty_favorites.png',
                              color: Colors.red,
                              height: 250,
                            ),

                            const SizedBox(height: 16),
                            Text(
                              'Your wishlist is empty',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: favoriteList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return _favoriteProduct(
                        context,
                        provider,
                        favoriteList,
                        index,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _favoriteProduct(
    BuildContext context,
    FavoriteProvider provider,
    List<ProductsModel> favoriteList,
    int index,
  ) {
    final favoriteItem = favoriteList[index];

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: colorBg,
              borderRadius: BorderRadius.circular(20),
            ),

            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(12),

                  child: Image.asset(favoriteItem.image),
                ),

                const SizedBox(width: 8),
                SizedBox(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        favoriteItem.title,
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        favoriteItem.categories.join(
                          ', ',
                        ),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: colorLabel,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 8),
                      Text(
                        '\$${favoriteItem.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        Positioned(
          top: 32,
          right: 32,

          child: Column(
            children: [
              // Delete Button
              IconButton(
                onPressed: () {
                  provider.toggleFavorite(favoriteItem);
                },
                icon: Icon(Icons.delete, color: Colors.red, size: sizeIcon - 4),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
