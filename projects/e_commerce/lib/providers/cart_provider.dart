import 'package:e_commerce/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// A provider class that manages the state of the shopping cart.
class CartProvider extends ChangeNotifier {
  final List<ProductsModel> _cart = [];

  /// Returns the current list of products in the cart.
  List<ProductsModel> get cart => _cart;

  /// Adds a product to the cart with the specified quantity.
  ///
  /// If the product already exists (based on title), it updates the quantity.
  /// Otherwise, add it on the list with the quantity desired.
  void addToCart(ProductsModel product, int productQtdToAdd) {
    final index = _cart.indexWhere((p) => p.title == product.title);

    if (index != -1) {
      _cart[index].quantity += productQtdToAdd;
    } else {
      product.quantity = productQtdToAdd;
      _cart.add(product);
    }

    notifyListeners();
  }

  /// Increments the quantity of a product at the specified index.
  void incrementProductQtd(int index) {
    _cart[index].quantity++;
    notifyListeners();
  }

  /// Decrements the quantity of a product at the specified index.
  ///
  /// If the quantity becomes zero, the product is removed from the cart.
  void decrementProductQtd(int index) {
    if (_cart[index].quantity > 1) {
      _cart[index].quantity--;
    } else {
      _cart.removeAt(index);
    }
    notifyListeners();
  }

  /// Removes a product from the cart by its index.
  ///
  /// Does nothing if the index is out of range.
  void removeProductByIndex(int index) {
    if (index >= 0 && index < _cart.length) {
      _cart.removeAt(index);
      notifyListeners();
    }
  }

  /// Calculates the total price of all products in the cart.
  ///
  /// Returns a double representing the total checkout value.
  double checkOutValue() {
    return _cart.fold(0, (sum, item) => sum + item.price * item.quantity);
  }

  /// A convenient method to access the provider from the widget tree.
  ///
  /// Pass `listen: false` if you don't want to subscribe to changes.
  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
