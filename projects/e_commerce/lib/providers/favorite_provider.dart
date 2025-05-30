import 'package:e_commerce/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// A provider class that manages the state of the favorite list.
class FavoriteProvider extends ChangeNotifier {
  final List<ProductsModel> _favorites = [];

  /// Returns the current list of products in the favorite.
  List<ProductsModel> get favorites => _favorites;

  /// Check if the product is in the list
  bool productInFavorite(ProductsModel product) {
    return _favorites.any((p) => p.title == product.title);
  }

  /// Adds or Removes a product of the favorite list.
  void toggleFavorite(ProductsModel product) {
    if (productInFavorite(product)) {
      _favorites.removeWhere((p) => p.title == product.title);
    } else {
      _favorites.add(product);
    }
    notifyListeners();
  }

  /// A convenient method to access the provider from the widget tree.
  ///
  /// Pass `listen: false` if you don't want to subscribe to changes.
  static FavoriteProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavoriteProvider>(context, listen: listen);
  }
}
